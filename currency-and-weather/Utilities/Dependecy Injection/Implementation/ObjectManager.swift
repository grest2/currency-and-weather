//
//  ObjectManager.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation
import Promises
import Resolver


class ObjectManager: IObjectManager {
    
    private let requestService: IRequestService = Resolver.resolve();
    
    func getObjectList<T>(type:T.Type,url: String) -> Promise<ItemRequest<T>> {
        return requestService.getMethod(url: url).then {
            json in
            let reqItems = ItemRequest(type: type, json: json)
            return Promise(reqItems)
        }
    }
    
}
