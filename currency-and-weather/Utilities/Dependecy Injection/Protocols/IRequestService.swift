//
//  RequestService.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation
import Promises

protocol IRequestService {
    func getMethod(url: String ) -> Promise<[String: Any]>
}
