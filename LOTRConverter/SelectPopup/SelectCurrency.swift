//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Oleksandr Bardashevskyi on 24.03.2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var currency: Currency

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .padding()

                IconGrid(selectedCurrency: $currency)

                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding(.top, 40)
                .foregroundStyle(.white)
            }
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperPenny

    SelectCurrency(currency: $currency)
}
