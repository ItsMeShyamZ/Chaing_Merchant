import Foundation
import ObjectMapper

struct HomeEntity : Mappable {
    var id : Int?
    var first_name : String?
    var last_name : String?
    var payment_mode : String?
    var email : String?
    var picture : String?
    var small_avatar : String?
    var cover : String?
    var small_cover : String?
    var device_token : String?
    var device_id : String?
    var device_type : String?
    var login_by : String?
    var social_unique_id : String?
    var mobile : String?
    var dob : String?
    var latitude : String?
    var longitude : String?
    var stripe_cust_id : String?
    var wallet_balance : Int?
    var rating : String?
    var rating_count : Int?
    var otp : Int?
    var total_friends : Int?
    var total_posts : Int?
    var post : [Posts]?
    var posts : [Posts]?
    init(){}
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
        device_token <- map["device_token"]
        device_id <- map["device_id"]
        device_type <- map["device_type"]
        login_by <- map["login_by"]
        social_unique_id <- map["social_unique_id"]
        mobile <- map["mobile"]
        dob <- map["dob"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        stripe_cust_id <- map["stripe_cust_id"]
        wallet_balance <- map["wallet_balance"]
        rating <- map["rating"]
        rating_count <- map["rating_count"]
        otp <- map["otp"]
        total_friends <- map["total_friends"]
        total_posts <- map["total_posts"]
        posts <- map["posts"]
        post <- map["post"]
    }
    
}

struct Likes_types : Mappable {
    var id : Int?
    var title : String?
    var icon : String?
    var status : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        title <- map["title"]
        icon <- map["icon"]
        status <- map["status"]
    }
    
}


struct Posts : Mappable {
    var id : Int?
    var user_id : Int?
    var user_type : String?
    var type : String?
    var description : String?
    var created_at : String?
    var updated_at : String?
    var likes_types : [Likes_types]?
    var is_liked : Int?
    var user : Users?
    var image : [ImageEntity]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        user_id <- map["user_id"]
        user_type <- map["user_type"]
        type <- map["type"]
        description <- map["description"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        likes_types <- map["likes_types"]
        is_liked <- map["is_liked"]
        user <- map["user"]
        image <- map["image"]
    }
    
}

struct Users : Mappable {
    var id : Int?
    var first_name : String?
    var last_name : String?
    var payment_mode : String?
    var email : String?
    var picture : String?
    var small_avatar : String?
    var cover : String?
    var small_cover : String?
    var device_token : String?
    var device_id : String?
    var device_type : String?
    var login_by : String?
    var social_unique_id : String?
    var mobile : String?
    var dob : String?
    var latitude : String?
    var longitude : String?
    var stripe_cust_id : String?
    var wallet_balance : Int?
    var rating : String?
    var rating_count : Int?
    var otp : Int?
    var total_friends : Int?
    var total_posts : Int?
    
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
        device_token <- map["device_token"]
        device_id <- map["device_id"]
        device_type <- map["device_type"]
        login_by <- map["login_by"]
        social_unique_id <- map["social_unique_id"]
        mobile <- map["mobile"]
        dob <- map["dob"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        stripe_cust_id <- map["stripe_cust_id"]
        wallet_balance <- map["wallet_balance"]
        rating <- map["rating"]
        rating_count <- map["rating_count"]
        otp <- map["otp"]
        total_friends <- map["total_friends"]
        total_posts <- map["total_posts"]
    }
    
}

struct ImageEntity : Mappable {
    var id : Int?
    var post_id : Int?
    var image : String?
    var status : String?
    var created_at : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        post_id <- map["post_id"]
        image <- map["image"]
        status <- map["status"]
        created_at <- map["created_at"]
        
}
}

struct LikeReq : Codable {
    var user_id : String?
    var post_id : String?
    var like_id : String?
   
}

struct CommonEntity : Mappable {
    var message : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        message <- map["message"]
        
    }
}
