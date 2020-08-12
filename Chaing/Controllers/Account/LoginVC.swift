//
//  LoginVC.swift
//  Gron
//
//  Created by Abservetech on 19/02/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit
import CountryPickerView
import ObjectMapper

class LoginVC: UIViewController {
    
    @IBOutlet weak var phoneTxt : UITextField!
    @IBOutlet weak var phoneView : UIView!
    @IBOutlet weak var countryCodeView : UIView!
    @IBOutlet weak var countryCode : CountryPickerView!
    @IBOutlet weak var loginBtn : UIButton!
    @IBOutlet weak var signupBtn : UIButton!
    @IBOutlet weak var doyouhaveAccountLbl : UILabel!
    @IBOutlet weak var titleLbl : UILabel!
    
    @IBOutlet weak var passwordTxt : UITextField!
    @IBOutlet weak var passwordView : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupAction()
        self.setupData()
    }
    
    func setupView(){
        //        self.setupCountryPicker()
        self.loginBtn.setCorneredElevation(shadow: 2, corner: 20, color: .primaryColor)
        [self.countryCodeView,self.phoneView,self.passwordView].forEach { (view) in
            view?.setCorneredElevation(shadow: 1, corner: 30, color: .white, clipstobound: .no)
            view?.layer.borderColor = UIColor.darkGray.cgColor
            view?.layer.borderWidth = 1
            
        }
    }
    
    func setupData(){
        self.countryCode.setCountryByPhoneCode(Constant.country_phcode)
        
    }
    
    func setupAction(){
        self.loginBtn.addTap {
            self.validation()
            
        }
        
        self.signupBtn.addTap {
            
            self.push(from: self, ToViewContorller: SignupVC.initVC(storyBoardName: .account, vc: SignupVC.self, viewConrollerID: .signup))
        }
        
    }
    
    func validation(){
        guard let num = self.phoneTxt.text, num.isEmpty != true else {
            showToast(msg: "Please Enter Mobile or Email Address")
            return
        }
        guard let password = self.passwordTxt.text, password.isEmpty != true else {
            showToast(msg: "Please Enter Password")
            return
        }
        
        var loginreq = LoginReq()
        loginreq.email = self.phoneTxt.text ?? ""
        loginreq.password = password
        self.loginApi(with: loginreq)
        
    }
    
}


extension LoginVC{
    func loginApi(with login_model : LoginReq){
        self.postLogin(loginData: login_model)
    }
}
extension LoginVC : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.LoginEntity:
                var data = dataDict as? LoginEntity
                if !(data?.access_token ?? "").isEmpty{
                    UserDefaultConfig.Token = data?.access_token ?? ""
                    //                    showToast(msg: data?.token_type ?? "")
                    UserDefaultConfig.AppState =  NavigationOption.home.rawValue
                    self.push(from: self, ToViewContorller: MoneyTransferVC.initVC(storyBoardName: .account, vc: MoneyTransferVC.self, viewConrollerID: .MoneyTransferVC))
                }else{
                    //                    showToasts(msg: "The given data was invalid.")
                }
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func postLogin(loginData : LoginReq){
        self.presenter?.HITAPI(api: Base.login.rawValue, params: convertToDictionary(model: loginData), methodType: .POST, modelClass: LoginEntity.self, token: true)
    }
    
}
