//
//  CircleTextView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 13/11/23.
//

import SwiftUI

struct CircleTextView: View {
    let color: Color
    let text: String

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            Text(text)
                .font(.title)
                .foregroundStyle(Color("AppWhiteColor"))
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
    }
}

#Preview {
    CircleTextView(color: Color.green, text: "999")
        .frame(maxWidth: 50, maxHeight: 50)
}
