//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/26/24.
//

import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    //plug these variables in the implementation then create new sintances in in main code
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview{
    ExchangeRate(leftImage: .doge
                 , text: "nigga"
                 , rightImage: .doge
    )
}
