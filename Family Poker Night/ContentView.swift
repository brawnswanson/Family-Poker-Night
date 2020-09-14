//
//  ContentView.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
	
	@ObservedObject var model = GamePlayModel()
	@State var numberOfPlayers: Int = 1
	@State var numberOfPlayersStepperIsVisible = true
	
    var body: some View {
		VStack {
			ForEach(model.players, id: \.id) { player in
				PlayerView(player: player)
			}
			HStack {
				Spacer()
				ForEach(model.board, id: \.id) { card in
					CardView(card: card).padding(EdgeInsets(top: 0.0, leading: 1.0, bottom: 0.0, trailing: 1.0))
				}
				Spacer()
			}
			if numberOfPlayersStepperIsVisible {
				Stepper(value: $numberOfPlayers, in: 1...6) {
					Text("Number of Players:     \(numberOfPlayers)")
				}
			}
			else {
				Text("Current Pot: ").font(.title)
			}
			HStack {
				Button(action: {self.shuffleAndDeal()}) {Text("Shuffle")}
				Spacer().frame(width: 50)
				Button(action: {self.startGame()}) {Text("Start Game")}
			}
		}
    }
	
	func startGame() {
		numberOfPlayersStepperIsVisible = false
		model.startGame(numberOfPlayers: numberOfPlayers)
	}
	
	func shuffleAndDeal() {
		model.calcBlindPositions()
		model.deal()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
