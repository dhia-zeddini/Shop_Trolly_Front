//
//  CustomTF.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct CustomTF: View {
   
    var iconTint: Color = Color(hex: "#44F1A6")
    var hint: String
    var isPassword: Bool = false
    @State var showPassword: Bool = false
    
    @Binding var value: String
    var body: some View {
        HStack(alignment: .top,spacing: 8, content: {
          
            
            VStack(alignment: .leading,spacing: 8, content: {
                if isPassword{
                    Group{
                        if showPassword{
                            TextField(hint,text: $value)
                                .padding(.horizontal,20)

                        }else{
                            SecureField(hint,text: $value)
                                .padding(.horizontal,20)

                        }
                    }
                }else{
                    TextField(hint,text: $value)
                        .padding(.horizontal,20)
                }
                Divider()
            })
            .overlay(alignment: .trailing){
                if isPassword{
                    Button(action: {
                        withAnimation{
                            showPassword.toggle()
                            
                        }
                    } ,label: {
                        Image(systemName: showPassword ?  "eye.slash" : "eye")
                            .foregroundColor(.secondary)
                            .padding(10)
                            //.contentShape(.rect)
                        
                    })
                }
            }
        })
        .padding(.top, 10)
        .background(Color(hex: "#F7F8F9"))
        .cornerRadius(3)
        //.padding(.horizontal, 40)
        
        
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

