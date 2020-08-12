//
//  LoginEntity.swift
//  Project
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginReq : Codable{
    var device_type : String = "ios"
    var client_id : Int = appClientId
    var client_secret : String = appSecretKey
    var grant_type : String = "password"
    var username : String?
    var email : String?
    var password : String?
    var device_id : String = "11"
    var device_token  : String = "12345"
}

struct signupReq : Codable{
    var device_type : String = "ios"
    var device_token  : String = "12345"
    var login_by  : String? = "manual"
    var client_id : Int = appClientId
    var client_secret : String = appSecretKey
    var email : String = ""
    var mobile : String?
    var password : String?
    var name : String?
    var dob : String?
    var password_confirmation : String?
    var device_id : String = "11"
}


struct LoginEntity : Mappable {
    var id : Int?
    var first_name : String?
    var last_name : String?
    var email : String?
    var mobile : String?
    var avatar : String?
    var small_avatar : String?
    var cover : String?
    var small_cover : String?
    var description : String?
    var rating : String?
    var status : String?
    var latitude : String?
    var longitude : String?
    var rating_count : Int?
    var otp : Int?
    var dob : String?
    var political_party : String?
    var qrcode_url : String?
    var merchant : String?
    var access_token : String?
    var currency : String?
    var service : String?
    var device : Device?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        mobile <- map["mobile"]
        avatar <- map["avatar"]
        small_avatar <- map["small_avatar"]
        cover <- map["cover"]
        small_cover <- map["small_cover"]
        description <- map["description"]
        rating <- map["rating"]
        status <- map["status"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        rating_count <- map["rating_count"]
        otp <- map["otp"]
        dob <- map["dob"]
        political_party <- map["political_party"]
        qrcode_url <- map["qrcode_url"]
        merchant <- map["merchant"]
        access_token <- map["access_token"]
        currency <- map["currency"]
        service <- map["service"]
        device <- map["device"]
    }
    
}



struct Device : Mappable {
    var id : Int?
    var provider_id : Int?
    var udid : String?
    var token : String?
    var sns_arn : String?
    var type : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        provider_id <- map["provider_id"]
        udid <- map["udid"]
        token <- map["token"]
        sns_arn <- map["sns_arn"]
        type <- map["type"]
    }
    
}



struct signupEntity : Mappable {
    var first_name : String?
    var last_name : String?
    var email : String?
    var mobile : String?
    var dob : String?
    var merchant : String?
    var status : String?
    var qrcode_url : String?
    var id : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        email <- map["email"]
        mobile <- map["mobile"]
        dob <- map["dob"]
        merchant <- map["merchant"]
        status <- map["status"]
        qrcode_url <- map["qrcode_url"]
        id <- map["id"]
    }
    
}
struct transactionReq : Codable{
    var customer_number : String = ""
    var amount  : String = ""
    var description  : String? = ""
}


struct TransactionEntity : Mappable {
    var message : String?
    var transaction : Transaction?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        message <- map["message"]
        transaction <- map["transaction"]
    }
    
}


struct Transaction : Mappable {
    var transaction_id : String?
    var merchant_id : Int?
    var customer_id : Int?
    var customer_number : String?
    var amount : String?
    var description : String?
    var is_scanned : Int?
    var status : String?
    var id : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        transaction_id <- map["transaction_id"]
        merchant_id <- map["merchant_id"]
        customer_id <- map["customer_id"]
        customer_number <- map["customer_number"]
        amount <- map["amount"]
        description <- map["description"]
        is_scanned <- map["is_scanned"]
        status <- map["status"]
        id <- map["id"]
    }
    
}

struct walletReq : Codable{
    var merchant_number : String = ""
}
