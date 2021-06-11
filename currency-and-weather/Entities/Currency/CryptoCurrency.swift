//
//  CryptoCurrency.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

class CryptoCurrency: IItemWithId {
    var id: Int
    var symbol: String
    var name: String
    var supply: String
    var maxSupply: String
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var priceUsd: String
    var changePercent24Hr: String
    var vwap24Hr: String
    var cryptoUrl: String
    
    required init(json: [String: Any])  {
        if let id = json["rank"] as? Int {
            self.id = id
        } else {
            self.id = -1
        }
        if let symbol = json["symbol"] as? String {
            self.symbol = symbol
        } else {
            self.symbol = "-1"
        }
        if let name = json["name"] as? String {
            self.name = name
        } else {
            self.name = "-1"
        }
        if let supply = json["supply"] as? String {
            self.supply = supply
        } else {
            self.supply = "-1"
        }
        if let maxSupply = json["maxSupply"] as? String {
            self.maxSupply = maxSupply
        } else {
            self.maxSupply = "-1"
        }
        if let marketCapUsd = json["marketCapUsd"] as? String {
            self.marketCapUsd = marketCapUsd
        } else {
            self.marketCapUsd = "-1"
        }
        if let volumeUsd24Hr = json["volumeUsd24hr"] as? String {
            self.volumeUsd24Hr = volumeUsd24Hr
        } else {
            self.volumeUsd24Hr = "-1"
        }
        if let priceUsd = json["priceUsd"] as? String {
            self.priceUsd = priceUsd
        } else {
            self.priceUsd = "-1"
        }
        if let changePercent24Hr = json["changePercent24Hr"] as? String {
            self.changePercent24Hr = changePercent24Hr
        } else {
            self.changePercent24Hr = "-1"
        }
        if let vwap24Hr = json["vwap24Hr"] as? String {
            self.vwap24Hr = vwap24Hr
        } else {
            self.vwap24Hr = "-1"
        }
        if let cryptoUrl = json["explorer"] as? String {
            self.cryptoUrl = cryptoUrl
        } else {
            self.cryptoUrl = "-1"
        }
    }
}
