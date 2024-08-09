//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Wayne Simmons Jr on 5/25/24.
//

import Foundation
import SwiftUI
import TipKit

struct ContentView: View {
    @State/*property view @State*/ var showExchangeInfo = false
    @State var  leftAmount = ""
    @State var  rightAmount = ""
    @State var CurrencySelect = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    

    
    var body: some View {
        ZStack{// ZStacks place objects from back to front
            //backgroung image
            Image(.background)
                .resizable()//as you can see we modify objects by placing '.' underneath followed by some member function
                .ignoresSafeArea()//see documentation to know the different ways to manipulate different objects
            
            VStack{//VStacks places things vertically from top to bottom
                //pracning pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // currency exchange
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // curency conversion section
                HStack{// HStacks places things horizontally from left to right
                    //left conversion section
                    VStack{
                        //currency
                        HStack{
                            //Currecny image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            CurrencySelect.toggle()
                        }
                        .popoverTip(CurrencyTips(), arrowEdge: .bottom)
                        .task {
                            try? Tips.configure()
                        }
                        
                        
                        //textfield
                        TextField("Ammount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftAmount){
                                if leftTyping{
                                    rightAmount = leftCurrency.convert(leftAmount, To: rightCurrency)
                                }
                            }
                            .onChange(of: leftCurrency){
                                leftAmount = rightCurrency.convert(rightAmount, To: leftCurrency)
                                UserDefaults.standard.set(leftCurrency.rawValue, forKey: "leftCurrency")
                                
                            }
                    }
                    
                    //equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //right conversion section
                    VStack{
                        //currency
                        HStack{
                            //Currecny text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            //currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            CurrencySelect.toggle()
                        }
                        
                        //textfield
                        TextField("Ammount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount){
                                if rightTyping{
                                    leftAmount = rightCurrency.convert(rightAmount, To: leftCurrency)
                                }
                            }
                            .onChange(of: rightCurrency){
                                rightAmount = leftCurrency.convert(leftAmount, To: rightCurrency)
                                UserDefaults.standard.setValue(rightCurrency.rawValue, forKey: "rightCurrency")
                            }
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .sheet(isPresented: $CurrencySelect) {
                    SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                }
                
                Spacer()
                
                
                //info button
                HStack {
                    
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                    }label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
                
                
                
                
            }
        }
        .onAppear {
            loadCurrencySelection()
        }
        .onTapGesture {
            leftTyping = false
            rightTyping = false
        }
    }
    
    func loadCurrencySelection() {
        if let leftValue = UserDefaults.standard.value(forKey: "leftCurrency") as? Double,
           let leftCurrency = Currency(rawValue: leftValue) {
            self.leftCurrency = leftCurrency
        }
        
        if let rightValue = UserDefaults.standard.value(forKey: "rightCurrency") as? Double,
           let rightCurrency = Currency(rawValue: rightValue){
            self.rightCurrency = rightCurrency
        }
    }
}

#Preview {
    ContentView()
}
