//
//  CartView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 27/1/2024.
//

import SwiftUI

struct CartView: View {
    private var nbrProducts:Int=0
    @State private var showDeletionAlert = false
        @State private var itemToDelete: String?
    @Environment(\.managedObjectContext) private var viewContext
    @State  private var items = [
             "Italy",
            "England",
            "Englanddd",
        ]
    var body: some View {
        
        VStack{
            HStack {
           
                Spacer()
                Text("CART")
                    .font(.title3)
                    .foregroundColor(Color.themePrimary)
                .bold()
                Spacer()
            
                      
            }
            HStack {
                Text("Your Cart")
                    .foregroundColor(Color.themePrimary)
                    .font(.largeTitle)
                // .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 40)
            HStack {
                Text("List (\(items.count))")
                    .foregroundColor(Color.themePrimary)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
        }
        List{
            ForEach(items,id: \.self) { item in
                CartProductSingleItem()
                                     .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                         Button(role: .destructive) {
                                             itemToDelete = item
                                             showDeletionAlert = true
                                         } label: {
                                             Image(systemName:"trash")
                                         }
                                     }
            }
           // .onDelete(perform: deleteItems)
        }.listStyle(PlainListStyle())
            .alert("Are you sure you want to delete this item?", isPresented: $showDeletionAlert) {
                        Button("Delete", role: .destructive) {
                            if let item = itemToDelete, let index = items.firstIndex(of: item) {
                                items.remove(at: index)
                            }
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("This action cannot be undone.")
                    }
        VStack {
            HStack{
                Text("Total")
                    .font(.title)
                    .bold()
                    .foregroundColor(.secondary)
                Spacer()
                Text("$ 1760")
                    .font(.title)
                    .bold()
                    .foregroundColor(.themePrimary)
                
            }.padding(.horizontal, 40)
            Button(action: {
                // Action to perform when the button is tapped
              
            }) {
                Text("Checkout")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.themeSecondary)
            .padding(.horizontal, 40)
            //.padding(.top,20)
            .padding(.bottom,50)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            items.remove(atOffsets: offsets)
        }
        
    }
}
#Preview {
    CartView()
}
