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
    
    var body: some View {
        List {
            ForEach(self.cryptoCurrencys, id: \.id) {
                cCurrency in
                Text(cCurrency.name)
            }
            .listRowBackground(Color.currencyback)
        }
        .background(Color.currencyback
                        .edgesIgnoringSafeArea(.all))
        .onAppear {
            self.objectManager.getObjectList(type: CryptoCurrency.self, url: url).then {
                let itemRequest = $0
                self.cryptoCurrencys.append(contentsOf: itemRequest.data)
            }
        }
    }
}


