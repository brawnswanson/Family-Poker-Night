//
//  Card.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import Foundation

struct Card: Identifiable {
	var suit: Suit
	var value: FaceValue
	var id = UUID()
	
	init(suit: Suit, value: FaceValue) {
		self.suit = suit
		self.value = value
	}
}

extension Card {
	enum Suit: String, CaseIterable {
		case hearts, diamonds, clubs, spades
		
		var imageName: String {
			switch  self {
			case .hearts:
				return "suit.heart.fill"
			case .diamonds:
				return "suit.diamond.fill"
			case .spades:
				return "suit.spade.fill"
			case .clubs:
				return "suit.club.fill"
			}
		}
		
		var color: String {
			switch self {
			case .clubs, .spades:
				return "black"
			case .diamonds, .hearts:
				return "red"
			}
		}
	}
	enum FaceValue: String, CaseIterable {
		case two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", jack = "J", queen = "Q", king = "K", ace = "A"
	}
}
