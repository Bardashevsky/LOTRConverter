//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 24.03.2025.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let leftText: String
    let rightImage: ImageResource
    let rightText: String

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            Text("\(leftText) = \(rightText)")

            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece,
                 leftText: "1 Gold Piece",
                 rightImage: .goldpenny,
                 rightText: "4 Gold Pennies")
}
