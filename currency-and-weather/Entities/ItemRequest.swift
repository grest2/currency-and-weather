//
//  Item.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

class ItemRequest<T> : Decodable where T: IItemWithId {
    var data: [T] = [T]()
    
    enum CodeKeys: String, CodingKey {
        case data
    }
}
