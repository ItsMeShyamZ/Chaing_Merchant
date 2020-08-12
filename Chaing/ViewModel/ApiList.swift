//
//  ApiList.swift
//  Centros_Camprios
//
//  Created by imac on 12/18/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation

//Http Method Types

enum HttpType : String{
    
    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case PUT = "PUT"
    case DELETE = "DELETE"
    
}

// Status Code

enum StatusCode : Int {
    
    case notreachable = 0
    case success = 200
    case multipleResponse = 300
    case unAuthorized = 401
    case notFound = 404
    case ServerError = 500
    
}

struct model {
    
    static let type = model()
    
    let RegisterModel = "RegisterModel"
    let LoginEntity = "LoginEntity"
    let HomeEntity = "HomeEntity"
    let CommonEntity = "CommonEntity"
    let SignupResponseModel = "SignupResponseModel"
    let AppointmentModel = "AppointmentModel"
    let CommonModel = "CommonModel"
    let CategoryList = "CategoryList"
    let DoctorsDetailModel = "DoctorsDetailModel"
    let ArticleModel = "ArticleModel"
    let MedicalRecordsModel = "MedicalRecordsModel"
    let DoctorsListModel = "DoctorsListModel"
    let ProfileModel = "ProfileModel"
    let FeedBackModel = "FeedBackModel"
    let BookingModel = "BookingModel"
    let signupEntity = "signupEntity"
    let TransactionEntity = "TransactionEntity"
    let TransactionListEntity = "TransactionListEntity"
    let ProfileEntity = "ProfileEntity"
}


enum Base : String{
  
    
    case signIn = "api/oauth/token"
    case signUp = "/api/provider/signup"
    case login = "/api/provider/oauth/token"
    case dashboard = "/api/provider/dashboard"
    case transaction = "/api/provider/create/transaction"
    case transactionlist = "/api/provider/get/transaction/list"
    case logout = "/api/provider/logout"
    case like = "/api/provider/like/post"
    case updateLocation = "api/provider/profile/location"
    case onlineStatus = "/api/provider/profile/available"
    case profile = "/api/provider/profile"
    case wallet = "/api/user/update/transaction/wallet"
   
    init(fromRawValue: String){
        self = Base(rawValue: fromRawValue) ?? .signUp
    }
    
    static func valueFor(Key : String?)->Base{
        
        guard let key = Key else {
            return Base.signUp
        }
        
//        for val in iterateEnum(Base.self) where val.rawValue == key {
//            return val
//        }
        
        if let base = Base(rawValue: key) {
            return base
        }
        
        return Base.signUp
        
    }
    
}
