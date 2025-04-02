//
//  Database.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 02.04.2025.
//

import Foundation

enum CurrencyKeys: String {
    case leftCurrency
    case leftCurrencyAmount
    case rightCurrency
}

@MainActor
enum CurrencyDatabase {
    @CurrencyBaseStorage(key: .leftCurrency, defaultValue: 0)
    static var leftCurrency: Double

    @CurrencyBaseStorage(key: .leftCurrencyAmount, defaultValue: "")
    static var leftCurrencyAmount: String

    @CurrencyBaseStorage(key: .rightCurrency, defaultValue: 0)
    static var rightCurrency: Double
}

// MARK: - Storage

@propertyWrapper
struct CurrencyBaseStorage<T: Codable> {
    private let key: String
    private let defaultValue: T
    private let userDefaults: UserDefaults

    init(key: CurrencyKeys, defaultValue: T, store: UserDefaults = .standard) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        userDefaults = store
    }

    var wrappedValue: T {
        get {
            guard let data = userDefaults.data(forKey: key) else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        }
    }
}
