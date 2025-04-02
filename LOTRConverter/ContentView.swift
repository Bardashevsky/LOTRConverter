//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 20.03.2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    @State var leftAmount = ""
    @State var rightAmount = "0"

    @FocusState var leftTyping

    @State var leftCurrency: Currency = .copperPenny
    @State var rightCurrency: Currency = .copperPenny

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack {
                    CurrentCurrencyView(isDisabled: false, currency: $leftCurrency,
                                  amount: $leftAmount)
                    .focused($leftTyping)

                    Spacer()
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    CurrentCurrencyView(isDisabled: true,
                                  currency: $rightCurrency,
                                  amount: $rightAmount)
                }
                .padding(40)
                .background(Color.black.opacity(0.4))
                .clipShape(Capsule())
                .padding()
                .keyboardType(.decimalPad)

                Spacer()

                HStack {
                    Spacer()

                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency
                    .convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            rightAmount = leftCurrency
                .convert(leftAmount, to: rightCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency
                .convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfoView()
        }
    }
}

#Preview {
    ContentView()
}
