//
//  CryptoCurrency.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

class CryptoCurrency: IItemWithId, Decodable {
    var id: String
    var symbol: String
    var name: String
    var supply: String
    var maxSupply: String?
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var priceUsd: String
    var changePercent24Hr: String
    var vwap24Hr: String?
    var cryptoUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id;
        case symbol;
        case name;
        case supply;
        case maxSupply;
        case marketCapUsd;
        case volumeUsd24Hr;
        case priceUsd;
        case changePercent24Hr;
        case vwap24Hr;
        case cryptoUrl = "explorer";
    }
    
}
