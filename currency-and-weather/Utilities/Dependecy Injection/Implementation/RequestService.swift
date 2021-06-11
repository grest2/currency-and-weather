//
//  RequestService.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/11/21.
//

import Foundation
import Promises

enum CustomError: LocalizedError {
    case errorMessage(message: String)
    
    var errorDescription: String? {
        switch self {
        case let .errorMessage(message):
            return message
        }
    }
}

class RequestService: IRequestService {
    func getMethod(url: String) -> Promise<[String: Any]> {
        return Promise<[String:Any]>(on: .global(qos: .background), {
            fulfill,reject in
            let task = URLSession.shared.dataTask(with: URL(fileURLWithPath: url)) {
                (data,response,error) in
                if let _data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] {
                            fulfill(json)
                        } else {
                            reject(CustomError.errorMessage(message: "Invalid JSON"))
                        }
                        
                    } catch {
                        reject(CustomError.errorMessage(message: "Error with json serialization"))
                    }
                } else {
                    if let _error = error {
                        reject(_error)
                    } else {
                        reject(CustomError.errorMessage(message: "Unknwon error"))
                    }
                    
                }
            }
            task.resume()
        })
    }
}
