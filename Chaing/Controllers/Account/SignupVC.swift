//
//  SignupVC.swift
//  Chaing
//
//  Created by AppleMac on 01/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit
import CountryPickerView

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
        [self.firstNameView,self.lastNameView,self.emailView,self.physicalAddView,self.uploadDocView,self.phoneView].forEach { (view) in
            view?.setCorneredElevation(shadow: 1, corner: 30, color: .white, clipstobound: .no)
            view?.layer.borderColor = UIColor.darkGray.cgColor
            view?.layer.borderWidth = 1
            
        }
    }
    
    func setupData(){
        
    }
    
    func setupAction(){
        self.loginBtn.addTap {
            self.pop(from: self)
        }
        
        
    }
    
    func validation(){
        var canLogin : Bool = true
        
    }
    
}




extension SignupVC{
    //    func loginApi(with login_model : LoginReq){
    ////        AccountVM(vc: self).loginApiCall(data : convertToDictionary(model: login_model)!)
    //    }
}
