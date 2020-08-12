//
//  SignupVC.swift
//  Chaing
//
//  Created by AppleMac on 01/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit
import CountryPickerView
import ObjectMapper

class SignupVC: UIViewController {
    
    
    @IBOutlet weak var firstNameTxt : UITextField!
    @IBOutlet weak var firstNameView : UIView!
    
    
    @IBOutlet weak var lastNameTxt : UITextField!
    @IBOutlet weak var lastNameView : UIView!
    
    @IBOutlet weak var phoneTxt : UITextField!
    @IBOutlet weak var phoneView : UIView!
    
    @IBOutlet weak var emailTxt : UITextField!
    @IBOutlet weak var emailView : UIView!
    
    @IBOutlet weak var physicalAddTxt : UITextField!
    @IBOutlet weak var physicalAddView : UIView!
    
    @IBOutlet weak var uploadDocTxt : UITextField!
    @IBOutlet weak var uploadDocView : UIView!
    @IBOutlet weak var dobTxt : UITextField!
    @IBOutlet weak var dobView : UIView!
    @IBOutlet weak var passwordTxt : UITextField!
    @IBOutlet weak var passwordView : UIView!
    @IBOutlet weak var cpasswordTxt : UITextField!
    @IBOutlet weak var cpasswordView : UIView!
    @IBOutlet weak var datepickerBtn: UIButton!
    
    
    
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
        self.signupBtn.setCorneredElevation(shadow: 2, corner: 20, color: .primaryColor)
        [self.firstNameView,self.lastNameView,self.emailView,self.physicalAddView,self.uploadDocView,self.phoneView,self.datepickerBtn,self.passwordView,self.cpasswordView].forEach { (view) in
            view?.setCorneredElevation(shadow: 1, corner: 20, color: .white, clipstobound: .no)
            view?.layer.borderColor = UIColor.darkGray.cgColor
            view?.layer.borderWidth = 1
            
        }
    }
    
    func setupData(){
        
    }
    
    func setupAction(){
        
        self.datepickerBtn.addTap {
            let view = DatePickerAlert.getView
            view.alertdelegate = self
            AlertBuilder().addView(fromVC: self , view).show()
        }
        
        self.loginBtn.addTap {
            self.pop(from: self)
        }
        
        self.signupBtn.addTap{
            self.validation()
        }
    }
    
    func validation(){
        guard let name = self.firstNameTxt.text, name.isEmpty != true else {
            showToast(msg: "Please Enter your firstname")
            return
        }
        guard let lname = self.lastNameTxt.text, lname.isEmpty != true else {
            showToast(msg: "Please Enter your lastname")
            return
        }
        guard let num = self.phoneTxt.text, num.isEmpty != true else {
            showToast(msg: "Please Enter Mobile or Email Address")
            return
        }
        guard let email = self.emailTxt.text, email.isEmpty != true else {
            showToast(msg: "Please Enter your mailid")
            return
        }
        guard let dob = self.dobTxt.text, dob.isEmpty != true else {
            showToast(msg: "Please Enter your Date of birth")
            return
        }
        guard let password = self.passwordTxt.text, password.isEmpty != true else {
            showToast(msg: "Please Enter Password")
            return
        }
        guard let cpassword = self.cpasswordTxt.text, cpassword.isEmpty != true else {
            showToast(msg: "Please Enter Confirm Password")
            return
        }
        
        if password != cpassword{
            showToast(msg: "Password and confirm password not in same")
            return
        }
        
        var signup = signupReq()
        signup.name = name + lname
        signup.email = email
        signup.mobile = num
        signup.dob = dob
        signup.password = password
        signup.password_confirmation = cpassword
        self.postSignup(with: signup)
        
    }
    
}

extension SignupVC : AlertDelegate{
    func selectedTime(time: String, alertVC: UIViewController) {
        
    }
    
    func selectedDate(date: String, month: String, year: String, dob: String, alertVC: UIViewController) {
        
        self.dobTxt.text = dob
    }
}

protocol AlertDelegate {
    func selectedDate(date : String,month : String,year : String,dob : String ,alertVC : UIViewController)
    func selectedTime(time : String,alertVC : UIViewController)
}


extension SignupVC : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.signupEntity:
                var data = dataDict as? signupEntity
//                if !(data?.accesstoken ?? "").isEmpty{
//                    UserDefaultConfig.Token = data?.accesstoken ?? ""
//                    self.push(from: self, ToViewContorller: MoneyTransferVC.initVC(storyBoardName: .account, vc: MoneyTransferVC.self, viewConrollerID: .MoneyTransferVC))
//                }else{
//                }
                self.pop(from: self)
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func postSignup(with : signupReq){
        self.presenter?.HITAPI(api: Base.signUp.rawValue, params: convertToDictionary(model: with), methodType: .POST, modelClass: signupEntity.self, token: true)
    }
    
}
