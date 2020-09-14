//
//  GamePlayModel.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import Foundation
import Combine

class GamePlayModel: ObservableObject {
	
	@Published var board: [Card] = []
	@Published var players: [Player] = []
	
	var subscriptions = Set<AnyCancellable>()
	
	func startGame(numberOfPlayers: Int) {
		players = []
		board = []
		for i in stride(from: numberOfPlayers, to: 0, by: -1) {
			players.append(Player(name: "Dan \(i)", id: i))
		}
		//TODO:- Need to set the blind amounts, communicate to player objects, update their stacks and also update the pot for the round.
		calcBlindPositions()
		deal()
	}
	
	func deal() {
		let newDeck = DeckModel()
		let newPublisher = newDeck.deal()
		
		newPublisher
		.prefix(5)
		.collect()
		.assign(to: \.board, on: self)
		.store(in: &subscriptions)
		
		for i in 0..<players.count {
			newPublisher
			.dropFirst(5 + i * 2)
			.prefix(2)
			.collect()
				.assign(to: \.players[i].hand, on: self)
			.store(in: &subscriptions)
		}
	}
}

extension GamePlayModel {
	//MARK: - Blinds functions
	func calcBlindPositions() {
		let dealerPosition: Int
		if let currentDealer = players.first(where: {$0.dealer == true}) {
			dealerPosition = currentDealer.id + 1 <= players.count ? currentDealer.id + 1 : 1
		}
		else {
			dealerPosition = Int.random(in: 1...players.count)
		}
		resetBlindsAndCurrentPlayer()
		let smallPosition = dealerPosition + 1 <= players.count ? dealerPosition + 1 : 1
		let bigPosition = smallPosition + 1 <= players.count ? smallPosition + 1 : 1
		let currentBidderPosition = bigPosition + 1 <= players.count ? bigPosition + 1 : 1
		getPlayerByID(id: dealerPosition).dealer = true
		getPlayerByID(id: smallPosition).smallBlind = true
		getPlayerByID(id: bigPosition).bigBlind = true
		getPlayerByID(id: currentBidderPosition).currentPlayer = true
	}
	
	func resetBlindsAndCurrentPlayer() {
		//TODO:- I feel like this should be done with a combine publisher. Publish a reset message and then each player automatically resets itself
		for player in players {
			player.smallBlind = false
			player.bigBlind = false
			player.dealer = false
			player.currentPlayer = false
		}
	}
	
	func getPlayerByID(id: Int) -> Player {
		return players.filter { $0.id == id }[0]
	}
}



