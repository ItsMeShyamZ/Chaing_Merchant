//
//  AccountVM.swift
//  Gron
//
//  Created by Abservetech on 24/03/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit
typealias errorType<T> = (T) -> ()
class AccountVM{
   
  var vc : UIViewController!
//  var signupReq : SignupReq!
  var loginpReq : LoginReq!
  init(){}
  init(vc : UIViewController) {
    self.vc = vc
  }
   
  var successLogin : loginRes?{
    didSet{
      if successLogin?.success ?? false{
        UserDefaultConfig.AppState = NavigationOption.home.rawValue
//        UserDefaultConfig.UserID = successLogin?.datas?[0]._id ?? ""
        UserDefaultConfig.Token = successLogin?.token ?? ""
//        UserDefaultConfig.UserName = successLogin?.datas?[0].name ?? ""
//        Constant.UserData = successLogin?.datas?.first ?? LoginDatas()
        self.loginSuccess?(successLogin!)
        Navigation.navigateTo(screen: UserDefaultConfig.AppState)
      }
    }
  }
   
  var errLogin : loginRes!{
    didSet{
      UserDefaultConfig.AppState = NavigationOption.launcher.rawValue
      showToast(msg: errLogin.message)
      let vc = self.vc as! LoginVC
      vc.phoneTxt.text = ""
//      vc.passwordTxt.text = ""
    }
  }
   


   
  var loginSuccess : ((loginRes) -> ())?
  var loginError : (errorType<loginRes>)?
   
   
  func loginApiCall(data : [String : Any]){
    let resource = Resource<loginRes>(vc: self.vc, url: Api.Accout.login, method: .patch ,params : data)
    WebService.shared.loadData(resource: resource,withAppURL: .yes) { (result , statusCode) in
      switch result{
      case .success(let data) :
        if statusCode.isResponseOK() {
           Log.rs(url : Api.Accout.login,data)
//            if data.success ?? false {
                self.successLogin = data
//            }else{
//                showToast(msg: data.message ?? "")
//            }
        }else{
          Log.er(url : Api.Accout.login,data)
          self.errLogin = data
        }
        break
      case .failure(let error) :
        Log.er(url : Api.Accout.login,error.localizedDescription)
        break
      }
    }
  }
  
}
