//
//  IObjectManager.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation
import Promises

protocol IObjectManager {
    func getObjectList<T>(type:T.Type,url: String) -> Promise<ItemRequest<T>>
}
