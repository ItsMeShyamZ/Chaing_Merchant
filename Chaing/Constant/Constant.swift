
import Foundation
import UIKit

struct R {
    struct Color {
       static var primary_color = "Primary"
       static var black_color = "Black"
       static var white_color = "White"
       static var gray_color = "Gray"
        static var light_gray = "PlaceHolder"
        static var offer_red = "Offer"
        static var unread_notify = "UnreaduNotify"
    }}



struct Constant {
    static var country_phcode = "+91"
    static var country_code = "IN"
    static var currency_sym = "₹"
    static var available_blance = "0"
    static var google_api = "AIzaSyBYhbI0k324KYMEBQfcDYhNuVoJKQaTMtU"
    static var mi_km = ""
    static var mobileNum_digit : Int = 10
    static var supportMail = "Support@gronride.com"
    static var distance_unit = "KM"
    static var notifyCount : Int = 0
    static var referralCode = ""
    
}

struct Paytm {
        static let MID =  "GRONSO06992077098307"
        static let INDUSTRY_TYPE_ID = "Retail"
        static let WEBSITE = "APPSTAGING"
        static let CALLBACK_URL = "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID="
        static let CUST_ID =  "CUST00011"   
        static let CHANNEL_ID = "WAP"
    }

extension Notification.Name {
    static let NotifyCount = Notification.Name("NotifyCount")
}
