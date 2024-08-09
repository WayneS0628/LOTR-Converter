//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/30/24.
//

import SwiftUI


struct CurrencyIcon: View {
    let cImage: ImageResource
    let cName: String
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            //currency image
            
            Image(cImage)
                .resizable()
                .scaledToFit()
            
            //currency name
            Text(cName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity) //.infinity makes the frame stretch to the edges of the parent view in the direction we gave it which was infinity in our case
            //our parent view is the ZStack whos width is 100 which we define with a modifier below called "frame"
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width:100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}
#Preview {
    CurrencyIcon(cImage: .copperpenny, cName: "Copper")
}
