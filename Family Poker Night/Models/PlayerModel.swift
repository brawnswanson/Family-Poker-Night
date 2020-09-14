//
//  PlayerModel.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import Foundation

class Player: ObservableObject {
	var name: String
	var id: Int
	@Published var hand: [Card] = []
	@Published var bigBlind = false
	@Published var smallBlind = false
	@Published var dealer = false
	@Published var chipCount = 1000
	@Published var currentPlayer = false
	@Published var active = true
	@Published var currentBet: Int?
	
	init(name: String, id: Int) {
		self.name = name
		self.id = id
	}
}
