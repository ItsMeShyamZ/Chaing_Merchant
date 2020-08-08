//
//  LoginVC.swift
//  Gron
//
//  Created by Abservetech on 19/02/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit
import CountryPickerView

class LoginVC: UIViewController {
    
    @IBOutlet weak var phoneTxt : UITextField!
    @IBOutlet weak var phoneView : UIView!
    @IBOutlet weak var countryCodeView : UIView!
    @IBOutlet weak var countryCode : CountryPickerView!
    @IBOutlet weak var loginBtn : UIButton!
    @IBOutlet weak var signupBtn : UIButton!
    @IBOutlet weak var doyouhaveAccountLbl : UILabel!
    @IBOutlet weak var titleLbl : UILabel!
              
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupAction()
        self.setupData()
    }
    
    func setupView(){
        self.setupCountryPicker()
        self.loginBtn.setCorneredElevation(shadow: 2, corner: 20, color: .primaryColor)
        [self.countryCodeView,self.phoneView].forEach { (view) in
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
//            self.validation()
            
            self.push(from: self, ToViewContorller: MoneyTransferVC.initVC(storyBoardName: .account, vc: MoneyTransferVC.self, viewConrollerID: .MoneyTransferVC))
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
        
        var loginreq = LoginReq()
        loginreq.username = self.phoneTxt.text ?? ""
        loginreq.password = "123456"
        self.loginApi(with: loginreq)
        
    }
    
}

extension LoginVC : CountryPickerViewDelegate, CountryPickerViewDataSource{
    func setupCountryPicker(){
        countryCode.delegate = self
        countryCode.dataSource = self
        countryCode.showCountryCodeInView = false
        countryCode.showPhoneCodeInView = true
        countryCode.textColor = UIColor.blackColor
        
        self.countryCode.setCountryByPhoneCode(Constant.country_code)
    }
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country){
        Log.i("CountryCode , \(country)")
    }
}


extension LoginVC{
    func loginApi(with login_model : LoginReq){
        AccountVM(vc: self).loginApiCall(data : convertToDictionary(model: login_model)!)
    }
}
