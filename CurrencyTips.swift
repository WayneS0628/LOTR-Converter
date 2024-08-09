//
//  CurrencyTips.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 6/21/24.
//

import Foundation
import TipKit

struct CurrencyTips: Tip{
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
    //putting a question mark on a type makes it an optional text type which means we can set a value or set it to nil (kinda like null)
}
