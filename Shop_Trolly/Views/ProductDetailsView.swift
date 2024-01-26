//
//  ProductDetailsView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 25/1/2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedColorIndex: Int = 0 // Default to first color
    private let productColors: [Color] = [.secondary, Color.themeSecondary, Color.themePrimary] // Example colors
    var body: some View {
        VStack {
           // detailHeader
            productImage
            priceTag
            productDetails
        }
       // .interactiveDismissDisabled()
        .padding(.horizontal,40)
       // .padding(.top, 20)
       // .padding(.bottom, 30)
    }
    
    private var detailHeader: some View {
        HStack {
            Spacer()
            Text("DETAILS")
                .font(.title3)
                .foregroundColor(.themePrimary)
                .bold()
            Spacer()
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
                    .font(.title2)
            }
            .foregroundColor(.black)
        }
    }
    
    private var productImage: some View {
        
        Image("jordan") // Replace with actual images
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/3)
        //.padding(.top, 100)
    }
    
    private var priceTag: some View {
        HStack {
            Spacer()
            Text("$650")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.themePrimary)
        }
       // .padding(.top, 20)
    }
    
    private var productDetails: some View {
        VStack {
            HStack(spacing: 10) {
                Text("Air Max 270")
                    .foregroundColor(.themePrimary)
                    .font(.largeTitle)
                Spacer()
                colorSelection
            }
            HStack {
                Text("Sneakers")
                    .foregroundColor(.themePrimary)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            HStack {
                Text("Structure")
                    .foregroundColor(.themePrimary)
                    .font(.title2)
                    .bold()
                Spacer()
            }.padding(.top,20)
            
            GeometryReader { geometry in
                HStack {
                    VStack(spacing: 10) {
                        structuretDetails(title: "Outer Material:", detail: "Leather 100%")
                        structuretDetails(title: "Inner Material:", detail: "Textile 100%")
                        structuretDetails(title: "Sole:", detail: "Rubber 100%")
                        HStack {
                            Text("... Details")
                                .font(.title2)
                                .foregroundColor(.themeSecondary)
                            Spacer()
                        }
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            Text("$650")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .frame(width: geometry.size.width / 4, height: geometry.size.height)
                    .background(Color.themeSecondary)
                    .cornerRadius(8) // Optional, if you want rounded corners
                }
            }
            .frame(height: 100) // Set a fixed height for the HStack containing the button
        }
    }

    
    private var colorSelection: some View {
        HStack(spacing: 10) {
            ForEach(productColors.indices, id: \.self) { index in
                Button(action: {
                    // Set the selected color index to this color
                    selectedColorIndex = index
                }) {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(productColors[index])
                        .overlay(
                            selectedColorIndex == index
                            ? Circle().stroke(productColors[index], lineWidth: 4)
                            : Circle().stroke(.clear, lineWidth: 0)
                        )
                }
            }
        }
    }
    private func structuretDetails(title: String, detail: String) -> some View {
            HStack {
                Text(title)
                    .foregroundColor(.secondary)
                Text(detail)
                    .foregroundColor(.themePrimary)
                Spacer()
            }
        }
}

#Preview {
    ProductDetailsView()
}
