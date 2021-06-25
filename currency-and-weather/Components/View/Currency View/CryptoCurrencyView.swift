//
//  CryptoCurrencyView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/24/21.
//
import Resolver
import SwiftUI

struct CryptoCurrencyView: View {
    
    let url: String = "https://api.coincap.io/v2/assets"
    
    private let objectManager: IObjectManager = Resolver.resolve()
    @State var cryptoCurrencys: [CryptoCurrency] = [CryptoCurrency]()
    @State var searchingName: String = ""
    
    
  
    
    var body: some View {
        VStack {
            SearchTextFieldView(placeholder: "Ennter currency name",text:$searchingName)
                
            List {
                ForEach(self.cryptoCurrencys, id: \.id) {
                    cCurrency in
                    Text(cCurrency.name)
                }
                .listRowBackground(Color.currencyback)
            }
            .onAppear {
                self.objectManager.getObjectList(type: CryptoCurrency.self, url: url).then {
                    let itemRequest = $0
                    self.cryptoCurrencys.append(contentsOf: itemRequest.data)
                }
            }
            .background(Color.currencyback)
        }
        
    }
}


