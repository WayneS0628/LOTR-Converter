//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 6/10/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases){ currency in
                if currency == self.currency{ // here the first currency is the currency property in the the if scope the self.currency is the currency property outside of the ZStack view. We can use a different name instead but if we dont want to (for some weird reason) we can do this
                CurrencyIcon(cImage: currency.image, cName: currency.name)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                    }
                }else {
                    CurrencyIcon(cImage: currency.image, cName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
            
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPenny))
}
