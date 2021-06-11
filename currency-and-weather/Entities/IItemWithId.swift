//
//  IItemWithId.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

protocol IItemWithId {
    var id: Int { get set }
    
    init(json:[String: Any])
}
