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
    
    func getObjectList<T>(type:T.Type,url: String) -> Promise<ItemRequest<T>> where T : IItemWithId	 {
        
        return requestService.getMethod(url: url).then {
            json in
            let reqItems = try JSONDecoder().decode(ItemRequest<T>.self, from: try JSONSerialization.data(withJSONObject: json))
            
            return Promise(reqItems)
        }.catch{
            print(String(describing: $0))
        }
    }
    
}
