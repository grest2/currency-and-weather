//
//  ContentView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import SwiftUI
import Resolver

struct ContentView: View {
    private let objectManager: IObjectManager = Resolver.resolve();
    @State var cryptoCurrencys: [CryptoCurrency] = [CryptoCurrency]()
    
    var body: some View {
        List {
            ForEach(cryptoCurrencys,id: \.id) {
                cCurrency in
                Text(cCurrency.name)
            }
        }.onAppear {
            objectManager.getObjectList(type: CryptoCurrency.self, url: "https://api.coincap.io/v2/assets").then {
                crypto in
                cryptoCurrencys.append(contentsOf: crypto.items)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
