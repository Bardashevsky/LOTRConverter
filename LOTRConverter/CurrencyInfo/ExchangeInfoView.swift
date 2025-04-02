//
//  ExchangeInfoView.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 21.03.2025.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(Color.brown)

            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)

                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()

                ExchangeRate(leftImage: .coinUA,
                             leftText: "1 Coin (UAH)",
                             rightImage: .goldpiece,
                             rightText: "10 Gold Pieces")

                ExchangeRate(leftImage: .goldpiece,
                             leftText: "1 Gold Piece",
                             rightImage: .goldpenny,
                             rightText: "4 Gold Pennies")

                ExchangeRate(leftImage: .goldpenny,
                             leftText: "1 Gold Pennies",
                             rightImage: .silverpiece,
                             rightText: "4 Silver Pieces")

                ExchangeRate(leftImage: .silverpiece,
                             leftText: "1 Silver Pieces",
                             rightImage: .silverpenny,
                             rightText: "4 Silver Pennies")

                ExchangeRate(leftImage: .silverpenny,
                             leftText: "1 Silver Pennies",
                             rightImage: .copperpenny,
                             rightText: "100 Copper Pennies")

                Button("Done") {
                    dismiss.callAsFunction()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}
