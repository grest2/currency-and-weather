//
//  Item.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

class ItemRequest<T> where T: IItemWithId {
    var items: [T] = [T]()
    
    
    init(type: T.Type,json:[String: Any]) {
        if let objectArray = json["data"] as? [Any] {
            objectArray.forEach({
                if let itemJson = $0 as? [String: Any] {
                    guard let item = try? type.init(json:itemJson) else {
                        return
                    }
                    items.append(item)
                }
            })
        }
    }

}
