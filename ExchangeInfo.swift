//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/26/24.
//

import SwiftUI



struct ExchangeInfo: View {
    @Environment(\.dismiss) var hideInfo
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                ExchangeRate(leftImage: .doge, text: "1 Doge Coin = 4 Gold Pieces", rightImage: .goldpiece)
                
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                
                Button("Done"){
                    hideInfo()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
                
            }
            Spacer()
        }
        .foregroundStyle(.black)
    }
}








#Preview {
    ExchangeInfo()
}

