//
//  CheckoutView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 3/2/2024.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack{
            HStack {
           
                Spacer()
                Text("CHECKOUT")
                    .font(.title3)
                    .foregroundColor(Color.themePrimary)
                .bold()
                Spacer()
            
                      
            }
        
            HStack {
                Text("Choose a Payment")
                    .foregroundColor(Color.themePrimary)
                    .font(.largeTitle)
                // .bold()
                Spacer()
            }
            
            .padding(.top, 40)
            HStack {
                Text("Method")
                    .foregroundColor(Color.themePrimary)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .center,spacing: 20) {
                    PaymentMethod(logo: "apple-pay")
                    PaymentMethod(logo: "visa-card")
                    PaymentMethod(logo: "master-card")
                    ZStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.themePrimary)
                                .frame(width: 30, height: 20)
                        }
                        .frame(width: 40, height: 30)
                        .padding()
                        .background(Color.themeGray)
                        .cornerRadius(5)
                    }
               
                }
            }
            HStack {
                Text("Delivery Address")
                    .foregroundColor(Color.themePrimary)
                    .font(.title2)
                    .bold()
                Spacer()
            }.padding(.top,30)
            DeliveryAdress().padding(.top,20)
            VStack(spacing: 10) {
                structuretDetails(title: "Subtotal", price: "$ 0000")
                structuretDetails(title: "Shipping Cost", price: "$ 00")
                structuretDetails(title: "Total", price: "$ 0000").padding(.top,10)
                Button(action: {
                    // Action to perform when the button is tapped
                  
                }) {
                    Text("Pay Now")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                        
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.themeSecondary)
                .padding(.top,70)
                .padding(.bottom,20)
            }.padding(.top,40)
            
        }.padding(.horizontal, 40)
  
    }
    private func structuretDetails(title: String, price: String) -> some View {
            HStack {
                Text(title)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
                Text(price)
                    .font(.title2)
                    .foregroundColor(.themePrimary)
                
            }
        }
}

#Preview {
    CheckoutView()
}

struct PaymentMethod: View {
    var logo:String
    var body: some View {
        ZStack {
            Button(action: {
                
            }) {
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .frame(width: 40, height: 30)
            }
    
            .padding()
            .background(Color.themeGray)
            .cornerRadius(5)
        }
    }
}
struct DeliveryAdress: View {
   
    var body: some View {
        HStack(spacing:20){
            Image("location-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: .infinity)
            VStack(alignment: .leading,spacing:10) {
                Text("Home Address")
                    .foregroundColor(.themePrimary)
                    .font(.title2)
                    .bold()

                Text("lastMessage")
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Spacer()
        
            }
            Spacer()
            Image(systemName: "highlighter")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.themePrimary)
                .frame(width: 30, height: 30)
            
        } .frame(height: 90)
        
    }
}
