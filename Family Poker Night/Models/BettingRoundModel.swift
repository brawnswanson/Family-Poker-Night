//
//  BettingRoundModel.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 14.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import Foundation

class BettingRound: ObservableObject {
	
	@Published var totalPot: Int = 0
	@Published var lastRaise: Int
	
	init(currentRaiseMin: Int) {
		self.lastRaise = currentRaiseMin
	}
}
