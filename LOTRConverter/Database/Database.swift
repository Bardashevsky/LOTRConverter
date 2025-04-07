//
//  Database.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 02.04.2025.
//

import Foundation
import SwiftUI

enum CurrencyKeys: String {
    case leftCurrency
    case leftCurrencyAmount
    case rightCurrency
}

@MainActor
enum CurrencyDatabase {
    @AppStorage(CurrencyKeys.leftCurrency.rawValue) static var leftCurrency: Double = 0
    @AppStorage(CurrencyKeys.rightCurrency.rawValue) static var rightCurrency: Double = 0
    @AppStorage(CurrencyKeys.leftCurrencyAmount.rawValue) static var leftCurrencyAmount: String = ""
}
