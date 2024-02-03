//
//  ChatSingleItem.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 2/2/2024.
//

import SwiftUI

struct ChatSingleItem: View {
     var logo:String
     var storeName:String
     var lastMessage:String
     var messageTime:String
     var nbrMessage:Int
   
    var body: some View {
        
        HStack {
              ZStack {
       
                      Image(logo)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 50, height: 50)
                          .foregroundColor(Color.themePrimary)
                
                  }
                  .frame(width: 60, height: 60)
                  .padding()
                  .background(Color.themeGray)
                  .cornerRadius(50)
              

              VStack(alignment: .leading, spacing: 10) {
                  Text(storeName)
                      .foregroundColor(.themePrimary)
                      .font(.title2)
                      .bold()

                  Text(lastMessage)
                      .foregroundColor(.secondary)
                      //.font(.title2)
                      .lineLimit(1)
                      .bold()

          
              }
              .padding(.horizontal, 20)
              Spacer()
            ZStack{
                Text(
                    nbrMessage != 0
                    ? ""
                    : "Yesrterday"
                )
                    .foregroundColor(.secondary)
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(
                        nbrMessage != 0
                        ? Color.themeSecondary
                        : .clear
                    )
               
                Text(
                    nbrMessage != 0
                    ? "2"
                    : ""
                )
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
            }
          }
          .frame(height: 90)
      }
  }


  

#Preview {
    ChatView(searchData: .constant(""))
}
