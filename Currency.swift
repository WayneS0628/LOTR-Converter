//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/31/24.
//

import SwiftUI

enum Currency: Double, Codable, CaseIterable, Identifiable, RawRepresentable{
    case copperPenny = 25600
    case silverPenny = 256
    case silverPiece = 64
    case goldPenny = 16
    case goldPiece = 4
    case Doge = 1
    
    var id: Currency {self}
    
    var image: ImageResource{
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        case .Doge:
                .doge
        }
    }
        var name: String{
            switch self {
            case .copperPenny:
                "Copper Penny"
            case .silverPenny:
                "Silver Penny"
            case .silverPiece:
                "Silver Piece"
            case .goldPenny:
                "Gold Penny"
            case .goldPiece:
                "Gold Piece"
            case .Doge:
                "Doge Coin"
            }
        }
    
    func convert(_ amountString: String, To currency: Currency) -> String{
        guard let doubleAmount = Double(amountString) else{
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
    
    
}

