//
//  ChatView.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

struct ChatView: View {
    
    @Binding var searchData: String
    @State private var showDeletionAlert = false
    @State private var itemToDelete: String?
    @Environment(\.managedObjectContext) private var viewContext
    @State  private var items = [
        "nike-logo",
        "adidas-logo",
        "under-armour-logo",
    ]
    var body: some View {
        NavigationStack{
        VStack(spacing:30){
            
            HStack {
                
                Spacer()
                Text("MESSAGES")
                    .font(.title3)
                    .foregroundColor(Color.themePrimary)
                    .bold()
                Spacer()
                
                
            }
            CustomTF( hint: "Enter your password ",isPassword: false, value: $searchData).padding(.horizontal, 40).padding(.top, 20)
            
            
            
            HStack {
                Text("Chat List (\(items.count))")
                    .foregroundColor(Color.themePrimary)
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
            
        }.padding(.top,20)
        
            List{
                ForEach(items,id: \.self) { item in
                    NavigationLink(destination: ChatRoomView(logo: item)) {
                        ChatSingleItem(logo: item, storeName: "Nike Store", lastMessage: "Your Order Has been Placed", messageTime: "Yesterday", nbrMessage: 0)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    itemToDelete = item
                                    showDeletionAlert = true
                                } label: {
                                    Image(systemName:"trash")
                                }
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
        }
    }
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                items.remove(atOffsets: offsets)
            }
            
        }
    }


#Preview {
    ChatView(searchData: .constant(""))
}
