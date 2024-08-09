//
//  CurrencyExchange.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 6/22/24.
//


//uncomment the below when ready to try this challenege again



//import SwiftUI
//import TipKit
//
//
//struct CurrencyExchange: View {
//    
//    @Binding var currency: Currency
//    @Binding var amount: String
//    @Binding var typing: Bool
//    @State var leftOrRight: Int
//    @Binding var CurrencySelect: Bool
//    @FocusState private var isFocused: Bool
//    
//    var body: some View {
//        if leftOrRight == 0{
//            
//            VStack{
//                //currency
//                HStack{
//                    //Currecny image
//                    
//                    Image(currency.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 33)
//                    
//                    //currency text
//                    Text(currency.name)
//                        .font(.headline)
//                        .foregroundStyle(.white)
//                    
//                    
//                }
//                .padding(.bottom, -5)
//                .onTapGesture {
//                    CurrencySelect.toggle()
//                }
//                .popoverTip(CurrencyTips(), arrowEdge: .bottom)
//                .task {
//                    try? Tips.configure()
//                }
//                
//                
//                //textfield
//                TextField("Ammount", text: $amount)
//                    .textFieldStyle(.roundedBorder)
//                    .focused($isFocused)
//                    .keyboardType(.decimalPad)
//                    .onTapGesture {
//                        typing = true
//                    }
//            }
//            
//        }else{
//            VStack{
//                //currency
//                HStack{
//                    //Currecny text
//                    Text(currency.name)
//                        .font(.headline)
//                        .foregroundStyle(.white)
//                    
//                    //currency image
//                    Image(currency.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 33)
//                }
//                .padding(.bottom, -5)
//                .onTapGesture {
//                    CurrencySelect.toggle()
//                }
//                
//                //textfield
//                TextField("Ammount", text: $amount)
//                    .textFieldStyle(.roundedBorder)
//                    .multilineTextAlignment(.trailing)
//                    .focused($isFocused)
//                    .keyboardType(.decimalPad)
//                    .onTapGesture {
//                        if isFocused{
//                            typing = true
//                        }else{
//                            typing = false
//                        }
//                    }
//                
//            }
//            .onTapGesture {
//                isFocused = false
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    CurrencyExchange(currency: .constant(Currency.Doge), amount: .constant(""), typing: .constant(false), leftOrRight: 0, CurrencySelect: .constant(false))
//}
