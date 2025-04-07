//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 20.03.2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @StateObject private var viewModel = CurrencyViewModel()

    @FocusState private var leftTyping
    @State private var showExchangeInfo = false

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
                    CurrentCurrencyView(
                        isDisabled: false,
                        currency: $viewModel.leftCurrency,
                        amount: $viewModel.leftAmount
                    )
                    .focused($leftTyping)
                    .onChange(of: viewModel.leftAmount) {
                        if leftTyping {
                            viewModel.updateLeftAmount(viewModel.leftAmount)
                        }
                    }
                    .onChange(of: viewModel.leftCurrency) {
                        viewModel.updateLeftCurrency(viewModel.leftCurrency)
                    }

                    Spacer()

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    CurrentCurrencyView(
                        isDisabled: true,
                        currency: $viewModel.rightCurrency,
                        amount: $viewModel.rightAmount
                    )
                    .onChange(of: viewModel.rightCurrency) {
                        viewModel.updateRightCurrency(viewModel.rightCurrency)
                    }
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
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfoView()
        }
        .onTapGesture {
            leftTyping = false
        }
        .task {
            try? Tips.configure()
        }
    }
}

#Preview {
    ContentView()
}
