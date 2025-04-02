//
//  Currency.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 25.03.2025.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 1
    case silverPenny = 100
    case silverPiece = 400
    case goldPenny = 1600
    case goldPiece = 6400
    case coinUA = 64000

    var id: Currency { self }

    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperpenny
        case .silverPenny:
            return .silverpenny
        case .silverPiece:
            return .silverpiece
        case .goldPenny:
            return .goldpenny
        case .goldPiece:
            return .goldpiece
        case .coinUA:
            return .coinUA
        }
    }

    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        case .coinUA:
            return "Coin (UAH)"
        }
    }

    func convert(_ amount: String, to currency: Currency) -> String {
        return String(format: "%.2f", (Double(amount) ?? 0) * self.rawValue / currency.rawValue)
    }

}
