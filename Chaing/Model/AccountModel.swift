//
//  AccountModel.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import Foundation

struct LoginReq : Codable {
    var grant_type : String = "password"
    var username : String = ""
    var password : String = ""
    var client_id : String = "2"
    var client_secret : String = "K18bIxqzcJRtPbRfbljitiLRCZA9cF7jCnCTnf9h"
    
}


struct loginRes : Codable {
    var success : Bool
    var message : String
    var token : String?
    
}

