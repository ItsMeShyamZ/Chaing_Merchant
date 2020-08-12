//
//  Transaction.swift
//  Chaing Merchant
//
//  Created by AppleMac on 12/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import Foundation
import ObjectMapper

struct TransactionListEntity : Mappable {
    mutating func mapping(map: Map) {
        transaction <- map[""]
    }
    init(){}
    init?(map: Map) {
        
    }
    
    var transaction : [TransactionList]?
}

struct TransactionList : Mappable {
    var id : Int?
    var transaction_id : String?
    var merchant_id : Int?
    var customer_id : Int?
    var customer_number : String?
    var amount : Int?
    var description : String?
    var is_scanned : Int?
    var status : String?
    var customer : Customer?
    init(){}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        transaction_id <- map["transaction_id"]
        merchant_id <- map["merchant_id"]
        customer_id <- map["customer_id"]
        customer_number <- map["customer_number"]
        amount <- map["amount"]
        description <- map["description"]
        is_scanned <- map["is_scanned"]
        status <- map["status"]
        customer <- map["customer"]
    }
    
}


struct Customer : Mappable {
    var id : Int?
    var first_name : String?
    var last_name : String?
    var payment_mode : String?
    var email : String?
    var picture : String?
    var small_avatar : String?
    var cover : String?
    var small_cover : String?
    var dob : String?
    var device_token : String?
    var device_id : String?
    var device_type : String?
    var login_by : String?
    var social_unique_id : String?
    var mobile : String?
    var latitude : String?
    var longitude : String?
    var stripe_cust_id : String?
    var wallet_balance : Int?
    var rating : String?
    var rating_count : Int?
    var otp : Int?
    var total_friends : Int?
    var total_posts : Int?
    var qrcode_url : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        payment_mode <- map["payment_mode"]
        email <- map["email"]
        picture <- map["picture"]
        small_avatar <- map["small_avatar"]
        cover <- map["cover"]
        small_cover <- map["small_cover"]
        dob <- map["dob"]
        device_token <- map["device_token"]
        device_id <- map["device_id"]
        device_type <- map["device_type"]
        login_by <- map["login_by"]
        social_unique_id <- map["social_unique_id"]
        mobile <- map["mobile"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        stripe_cust_id <- map["stripe_cust_id"]
        wallet_balance <- map["wallet_balance"]
        rating <- map["rating"]
        rating_count <- map["rating_count"]
        otp <- map["otp"]
        total_friends <- map["total_friends"]
        total_posts <- map["total_posts"]
        qrcode_url <- map["qrcode_url"]
    }
    
}

struct ProfileEntity : Mappable {
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
    var currency : String?
    
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
        currency <- map["currency"]
    }
    
}
