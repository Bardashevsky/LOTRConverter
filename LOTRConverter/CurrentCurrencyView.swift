//
//  CurrentCurrencyView.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 01.04.2025.
//

import SwiftUI

struct CurrentCurrencyView: View {
    let isDisabled: Bool

    @Binding var currency: Currency
    @Binding var amount: String

    @State var showSelectCurrency: Bool = false

    let currencyTip = CurrencyTip()

    var body: some View {
        VStack {
            VStack {
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 54)

                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
                currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)

            if !isDisabled {
                TextField("Amount", text: $amount)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 34)
                    .padding(.top)
            } else {
                Text(amount)
                    .font(.body)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 6)
                    .background(.white)
                    .cornerRadius(4)
                    .padding(.top)
            }
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(currency: $currency)
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperPenny
    @Previewable @State var amount: String = "9999"
    
    ZStack {
        Color(.black)

        CurrentCurrencyView(isDisabled: false,
                            currency: $currency,
                            amount: $amount,
                            showSelectCurrency: false)
    }
    .ignoresSafeArea()
}
