//
//  AddCardView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 3/2/2024.
//

import SwiftUI

struct AddCardView: View {
    @State private var cardType: String = ""
    @State private var cardHolderName: String = ""
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            Text("ADD CARD")
                .font(.title)
                .bold()
                .foregroundColor(Color(hex: "#152354"))
                .padding(.top, 40)
            
            VStack(alignment: .leading) {
                Text("Card Type")
                    .bold()
                    .foregroundColor(Color.secondary)
                CustomTF(hint: "Visa Card", value: $cardType)
            }
            
            VStack(alignment: .leading) {
                Text("Card Holder Name")
                    .bold()
                    .foregroundColor(Color.secondary)
                CustomEX(hint: "Card Holder Name", value: $cardHolderName)
            }
            
            VStack(alignment: .leading) {
                Text("Card Number")
                    .bold()
                    .foregroundColor(Color.secondary)
                CustomEX(hint: "Card Number", value: $cardNumber, isCardNumberOrCVV: true)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Expiry Date")
                        .bold()
                        .foregroundColor(Color.secondary)
                    CustomEX(hint: "MM/YY", value: $expiryDate, isExpiryDate: true)
                }

                VStack(alignment: .leading) {
                    Text("CVV")
                        .bold()
                        .foregroundColor(Color.secondary)
                    CustomEX(hint: "CVV", value: $cvv, isCardNumberOrCVV: true, isCVV: true)
                }
            }
            
            Spacer()
            
            Button(action: {
                // Action for Add Card
            }) {
                Text("Add Now")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .padding(.horizontal, 40)
    }
}





struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}


struct CustomEX: View {
    var hint: String
    @Binding var value: String
    var isExpiryDate: Bool = false
    var isCardNumberOrCVV: Bool = false
    var isCVV: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(hint, text: $value)
                .padding(.horizontal, 20)
                .onChange(of: value) { _ in
                    if isExpiryDate {
                        formatExpiryDate()
                    } else if isCardNumberOrCVV {
                        formatCardNumberOrCVV()
                    }
                }
                .keyboardType(isCardNumberOrCVV ? .numberPad : .default)
                .onSubmit {
                    if isCVV {
                        value = String(value.prefix(3))
                    }
                }
            Divider()
        }
        .padding(.top, 10)
        .background(Color(hex: "#F7F8F9"))
        .cornerRadius(3)
    }
    
    private func formatExpiryDate() {
        // Ensure only numbers are allowed, and limit the count to 4 digits
        value = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        value = String(value.prefix(4))
        
        // Insert a slash after the month if needed
        if value.count == 4 && !value.contains("/") {
            value.insert(contentsOf: "/", at: value.index(value.startIndex, offsetBy: 2))
        }
    }
    
    private func formatCardNumberOrCVV() {
        value = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        if isCVV {
            value = String(value.prefix(3))
        } else {
            value = String(value.prefix(16))
        }
    }
}


