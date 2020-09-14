//
//  BlindsView.swift
//  Family Poker Night
//
//  Created by Daniel Pressner on 11.09.20.
//  Copyright © 2020 Daniel Pressner. All rights reserved.
//

import SwiftUI

struct BigBlindView: View {
    var body: some View {
		ZStack {
			Circle()
				.frame(width: 20, height: 20, alignment: .center)
			Text("B").foregroundColor(Color.white)
		}
	}
}

struct SmallBlindView: View {
    var body: some View {
		ZStack {
			Circle()
				.frame(width: 20, height: 20, alignment: .center)
			Text("S").foregroundColor(Color.white)
		}
	}
}

struct DealerButtonView: View {
	var body: some View {
		ZStack {
			Circle()
				.frame(width: 20, height: 20, alignment: .center)
			Circle()
				.frame(width: 18, height: 18, alignment: .center)
				.foregroundColor(.white)
			Text("D").foregroundColor(Color.black)
		}
	}
}

struct BlindsView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			DealerButtonView()
			BigBlindView()
			SmallBlindView()
		}
    }
}
