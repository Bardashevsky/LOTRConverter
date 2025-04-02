//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 25.03.2025.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases, id: \.self) { currency in
                if currency == selectedCurrency {
                    CurrencyIcon(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .shadow(color: .black, radius: 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 2)
                            .opacity(0.5)
                    }
                } else {
                    CurrencyIcon(currencyImage: currency.image,
                                 currencyName: currency.name)
                    .onTapGesture {
                        selectedCurrency = currency
                    }
                }
            }
        }
    }
}
