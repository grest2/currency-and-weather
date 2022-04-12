//
//  Store.swift
//  currency-and-weather
//
//  Created by iOS Developer on 4/12/22.
//

import Foundation
import Combine

class Store: ObservableObject {
    @Published var crypto: [CryptoCurrency] = []
    
    var cryptoSub: AnyCancellable?
    
    init() { }
}
