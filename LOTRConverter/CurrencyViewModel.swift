//
//  CurrencyViewModel.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 07.04.2025.
//

import SwiftUI

@MainActor
final class CurrencyViewModel: ObservableObject {
    @Published var leftCurrency: Currency
    @Published var rightCurrency: Currency
    @Published var leftAmount: String
    @Published var rightAmount: String = ""

    @Published var isTypingLeft: Bool = false

    init() {
        self.leftCurrency = Currency(rawValue: CurrencyDatabase.leftCurrency) ?? .copperPenny
        self.rightCurrency = Currency(rawValue: CurrencyDatabase.rightCurrency) ?? .copperPenny
        self.leftAmount = CurrencyDatabase.leftCurrencyAmount

        convert()
    }

    func updateLeftCurrency(_ currency: Currency) {
        self.leftCurrency = currency
        CurrencyDatabase.leftCurrency = currency.rawValue
        self.convert()
    }

    func updateRightCurrency(_ currency: Currency) {
        rightCurrency = currency
        CurrencyDatabase.rightCurrency = currency.rawValue
        convert()
    }

    func updateLeftAmount(_ amount: String) {
        leftAmount = amount
        CurrencyDatabase.leftCurrencyAmount = amount
        convert()
    }

    private func convert() {
        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
    }
}
