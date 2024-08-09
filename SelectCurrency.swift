//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/30/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var hideC
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        
        
        ZStack{
            //parchme
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                //currency icons
                
                
                IconGrid(currency: $topCurrency)
                
                //text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                
                //currency icons
                
                IconGrid(currency: $bottomCurrency)
                
                //done button
                
                Button("Done"){
                    hideC()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
