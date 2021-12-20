//
//  IItemWithId.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation

protocol IItemWithId : Codable {
    var id: String { get set }
}
