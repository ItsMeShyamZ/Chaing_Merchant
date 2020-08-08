

import Foundation
import UIKit

public enum navigateFrom : String{
    case login
    case signup
    case none
}

public enum storyboardName : String{
    case main = "Main"
    case account = "Account"
    case home = "Home"
    case setting = "SupportSettings"
    case myride = "MyRides"
    case payment = "Payments"
    
}

public enum VCID : String{
    case viewcontroller = "ViewController"
    case splash = "SplashVC"
    case login = "LoginVC"
    case signup = "SignupVC"
    case activity = "ActivityVC"
    case Money = "MoneyVC"
    case Setting = "SettingVC"
    case TapBarView = "TapBarViewController"
    case MoneyTransferVC = "MoneyTransferVC"
    case alert = "AlertVC"
    case offline = "OfflineVC"
    case QRScanerVC = "QRScanerVC"
    
}

public enum viewID : String{
    case term_con = "TermsConditionView"
    case mobileOTP = "MobileOTPView"
}

public enum viewXib : String{
    case account_alert = "AccountCustomView"
    case setting_alert = "SettingustomViews"
    case ride_alert = "RideCustomView"
    case tripuser_alert = "TripUserView"
}



public enum cellID : String {
    case MessageCell = "MessageCell"
    case CardViewCell  = "CardViewCell"
    case SettingCell = "SettingCell"
}

public enum NavigationOption : String{
    case onboard
    case launcher
    case home
    case login
    case logout
    case payment
    case forceLogout
}

extension UIResponder {
    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}

extension UIViewController{
    
    
    var identifiers : String{
        return "\(self)"
    }
    
   static func getStoryBoard(withName name : storyboardName) -> UIStoryboard{
        return UIStoryboard.init(name: name.rawValue, bundle: Bundle.main)
    }
    
   static func initVC<T : UIViewController>(storyBoardName name : storyboardName , vc : T.Type , viewConrollerID id : VCID) -> T{
        return getStoryBoard(withName: name).instantiateViewController(withIdentifier: id.rawValue) as! T
    }
    
    func push<T : UIViewController>(from vc : T ,ToViewContorller contoller : UIViewController ){
        vc.navigationController?.pushViewController(contoller, animated: true)
    }
    
    func pop<T:UIViewController>(from vc : T){
        vc.navigationController?.popViewController(animated: true)
    }
    
  
    func present<T : UIViewController>(vc : T, _ isFullyPresent : YesNoType = .no){
        let vcl = vc
        if isFullyPresent == .no{
            vcl.modalPresentationStyle = .custom
        }else{
            vcl.modalPresentationStyle = .fullScreen
        }
        self.present(vc, animated: false, completion: nil)
    }
    func popMultipleVC(popViews: Int) {
        if self.navigationController!.viewControllers.count > popViews
        {
            let vc = self.navigationController!.viewControllers[self.navigationController!.viewControllers.count - popViews - 1]
             self.navigationController?.popToViewController(vc, animated: false)
        }
    }
    
   
    
}

struct Navigation {
    
    static func navigateTo(screen name : String){
         print("AppState" , name)
        var rootVC : UIViewController?
        switch name {
        case NavigationOption.onboard.rawValue:
            rootVC = ViewController.initVC(storyBoardName: .main, vc: ViewController.self, viewConrollerID: .viewcontroller)
        case NavigationOption.logout.rawValue:
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            UserDefaultConfig.AppState = NavigationOption.launcher.rawValue
            UserDefaultConfig.UserID = ""
            UserDefaultConfig.UserName = ""
            UserDefaultConfig.Token = ""
            
            rootVC = LoginVC.initVC(storyBoardName: .account, vc: LoginVC.self, viewConrollerID: .login)
       
        default:
              rootVC = ViewController.initVC(storyBoardName: .main, vc: ViewController.self, viewConrollerID: .viewcontroller)
        }
        let navigationController = UINavigationController(rootViewController: rootVC!)
        navigationController.navigationBar.isHidden = true
        navigationController.navigationBar.tintColor = UIColor.whiteColor
        if #available(iOS 13.0,*){
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
   
}
