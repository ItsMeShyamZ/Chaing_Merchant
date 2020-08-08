//
//  MoneyTransferVC.swift
//  Chaing
//
//  Created by AppleMac on 06/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit

class MoneyTransferVC: UIViewController {
    
    
    @IBOutlet weak var ToTxt : UITextField!
    @IBOutlet weak var ToView : UIView!
    
    
    @IBOutlet weak var ForTxt : UITextField!
    @IBOutlet weak var ForView : UIView!
    
    
    @IBOutlet weak var transferBtn : UIButton!
    @IBOutlet weak var ScanImg : UIImageView!
    @IBOutlet weak var moneyLbl : UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupAction()
        self.setupData()
    }
    
    func setupView(){
        self.transferBtn.setCorneredElevation(shadow: 2, corner: 20, color: .primaryColor)
        [self.ToView,self.ForView].forEach { (view) in
            view?.setCorneredElevation(shadow: 1, corner: 30, color: .white, clipstobound: .no)
            view?.layer.borderColor = UIColor.darkGray.cgColor
            view?.layer.borderWidth = 1
            
        }
    }
    
    func setupData(){
        
    }
    
    func setupAction(){
        self.transferBtn.addTap {
              self.push(from: self, ToViewContorller: TapBarViewController.initVC(storyBoardName: .home, vc: TapBarViewController.self, viewConrollerID: .TapBarView))
        }
        
        self.ScanImg.addTap {
            let vc = QRScanerVC.initVC(storyBoardName: .account, vc: QRScanerVC.self, viewConrollerID: .QRScanerVC)
            vc.modalPresentationStyle = .automatic
            self.navigationController?.present(vc, animated: true, completion: nil)
//            self.present(vc: )
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
