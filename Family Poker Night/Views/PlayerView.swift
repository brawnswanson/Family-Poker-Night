//
//  PlayerView.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
	
	@ObservedObject var player: Player
	@State var showBettingWindow: Bool = false
	
	var body: some View {
		HStack {
			Text("\(player.currentBet == nil ? "" : String(player.currentBet!))")
			ZStack {
				if player.bigBlind {
					BigBlindView()
				}
				else if player.smallBlind {
					SmallBlindView()
				}
				else if player.dealer {
					DealerButtonView()
				}
			}
			Text(player.name).padding(.trailing)
			ForEach(player.hand, id: \.id) { card in
				CardView(card: card)
			}
			Text("\(player.chipCount)").padding()
			if player.currentPlayer {
				BettingView(showHide: $player.currentPlayer)
			}
		}
		.disabled(!player.active)
	}
}

struct PlayerView_Previews: PreviewProvider {
	
    static var previews: some View {
		PlayerView(player: Player(name: "Dan", id: 3))
    }
}

struct BettingView: View {
	@Binding var showHide: Bool
	
	var body: some View {
		VStack {
			Button(action: {self.showHide = false}, label: {Text("Cancel")})
			Button(action: {}, label: {Text("Bet")})
		}
	}
}
