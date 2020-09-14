//
//  DeckModel.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import Foundation
import Combine

class DeckModel {

	var cards: [Card]
	
	init() {
		cards = []
		for suit in Card.Suit.allCases {
			for value in Card.FaceValue.allCases {
				let card = Card(suit: suit, value: value)
				cards.append(card)
			}
		}
		cards.shuffle()
	}
	
	func deal() -> AnyPublisher<Card, Never> {
		return cards.publisher
			.map {$0}
			.eraseToAnyPublisher()
	}
}
