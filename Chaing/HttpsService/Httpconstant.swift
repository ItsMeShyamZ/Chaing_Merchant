//
//  Httpconstant.swift
//  D911 Agency
//
//  Created by Abservetech on 05/02/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import Foundation

struct Api {
    static let baseURL = "http://142.93.202.230/"
    static let settingURL = "https://www.gronride.com:3001/"
    static let ImgURL = "https://www.gronride.com:3001/"
    static let socketURL = "https://www.gronride.com:3001/"
    
//    https://colleaguepool.com:3005/
    struct Support {
        static var supportURL = "supportcatg"
    }
    struct Accout {
        static let login = "oauth/token"
        static let sentotp = "sentotp"
        static let userProfile = "userProfile"
        static let viewprofile = "viewprofile"
        static let drivinglicense = "drivingLicence"
        static let user = "user"
        static let forgotPassword = "forgotPassword"
        static let changeCompanymail = "changeCompanymail"
        static let resendCompanyOtp = "resendCompanyOtp"
        static let verifyCompanyuser = "verifyCompanyuser"
        static let changeNumber = "changeNumber"
        static let activeNumber = "activeNumber"
        static let updatePassword = "updatePassword"
        static let deactivate = "deactivate"
    }
    struct Vehicle {
        static let userVehicle = "userVehicle"
        static let rcBookPic = "rcBookPic"
        static let defaultVehicle = "defaultVehicle"
        static let vechicleType = "vechicleType"
        
    }
    struct Myrides {
        static let notification = "notification"
        static let singleNotifyDelete = "user/notification"
        static let allNotifyDelete = "user/allnotification"
        static let upcoming = "upcoming"
        static let allrecurring = "allrecurring"
        static let cancelride = "cancelride"
        static let freeze = "ride/freeze"
        static let userRoute = "userRoute"
        static let ridepath = "ridepath"
        static let editRoute = "ride/editroute"
        static let removeunjoin = "trip/removeunjoined"
        static let timereschedule = "timereschedule"
        static let decline = "invite/decline"
        static let accept = "invite/accept"
        static let inviteRequest = "invite/request"
        static let getMatches = "getMatches"
        static let getinviteinfo = "ride/getinviteinfo"
        static let completed = "completed"
        static let completeBilling = "trip/completedreport"
        static let lostReport = "lostReport"
        static let recurring = "recurring"
        static let declineReason = "viewdeclineReason"
        static let checkin = "trip/checkin"
        static let start = "trip/start"
        static let checkout = "trip/checkout"
        static let endcheckinlist = "trip/end"
        static let ridedetail = "ridedetail"
        static let lostitem = "lostitem"
        static let referalCode = "referalCode"
    }
    struct trip {
        static let start = "trip/start"
        static let checkin = "trip/checkin"
        static let accept = "invite/accept"
        static let decline = "invite/decline"
    }
    struct Webview{
        static let term_condition = "tnc"
    }
    struct Review {
        static let review_rating = "viewReview"
    }
    struct Offer {
        static let offer_list = "currentoffers"
        static let checkCouponCode = "trip/checkCouponCode"
    }
    struct Setting {
        static let setting = "setting"
        static let settingInfo = "setting/info"
        static let notification = "setting/notification"
        static let reset = "setting/reset"
        static let security = "setting/security"
        static let ride = "setting/ride"
        static let vacation = "setting/vacation"
        static let emergency = "user/emergencyNumber"
        static let block = "block"
        static let favourite = "favourite"
        static let contactlist = "contactlist"
        static let company = "company"
        static let userCompany = "userCompany"
        static let userRoute = "userRoute"
        static let rating = "rating"
    }
    struct payment {
        static let redeem = "redeem/transaction"
        static let donate = "wallet/donate"
        static let donateImg = "donate"
        static let balance = "wallet/balance"
        static let latestTranscation = "latestTranscation"
        static let pastTranscation = "pastTranscation"
        static let chekMobileNumber = "chekMobileNumber"
        static let transferpoints = "wallet/transferpoints"
        static let generateChecksum = "generateChecksum"
    }
    
    struct google {
        static let nearbySearch = "https://maps.googleapis.com/maps/api/place/autocomplete/json?"
        static let directions = "https://maps.googleapis.com/maps/api/directions/json?"
    }
}

struct HttpError{
    static let noInternet = "Please check your internet connection"
    static let apiConnection = "Check api Method, network connetion , this error from app side only"
    static let serverError = "Api server Error , Check with backend Geeks"
    static let somthingWentWrong = "SomeThing Went Wrong"
}


extension Int{
    func isResponseOK() -> Bool{
        return (200...299).contains(self)
    }
}
