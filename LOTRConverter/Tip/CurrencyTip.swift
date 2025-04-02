//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 30.03.2025.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")

    var message: Text? = Text("You can tap the left or right currency to bring up Select Currency screen.")

    var image: Image? = Image(systemName: "hand.tap.fill")
}
