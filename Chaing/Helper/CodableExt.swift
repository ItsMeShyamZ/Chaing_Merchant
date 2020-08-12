//
//  CodableExt.swift
//  D911 Agency
//
//  Created by Abservetech on 05/02/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import Foundation

//public func convertToDictionary<T : Codable>(model : T) -> [String: Any]? {
//    
//    let jsonData = try! JSONEncoder().encode(model)
//    let jsonString = String(data: jsonData, encoding: .utf8)!
//    
//    if let data = jsonString.data(using: .utf8) {
//        do {
//            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? ["" : ""]
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    return ["" : ""]
//}
