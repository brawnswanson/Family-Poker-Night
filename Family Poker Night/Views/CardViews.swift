//
//  CardViews.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import SwiftUI

struct CardView: View {
	
	var card: Card
	var color: Color {
		switch card.suit.color {
		case "red":
			return Color.red
		case "black":
			return Color.black
		default:
			return Color.white
		}
	}
	
	var body: some View {
		VStack {
			HStack {
				Image(systemName: card.suit.imageName).padding(EdgeInsets(top: 1.0, leading: 3.0, bottom: 0, trailing: 0))
					.imageScale(.small)
					.foregroundColor(color)
				Spacer()
			}
			HStack {
				Spacer()
				Text("\(card.value.rawValue)")
				Spacer()
			}
			HStack {
				Spacer()
				Image(systemName: card.suit.imageName).padding(EdgeInsets(top: 0, leading: 0, bottom: 1.0, trailing: 3.0))
					.imageScale(.small)
					.foregroundColor(color)
			}
		}
		.frame(width: 50, height: 70)
		.border(Color.black, width: 1.0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(card: Card(suit: .clubs, value: .ten))
    }
}
