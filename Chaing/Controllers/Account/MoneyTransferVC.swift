//
//  MoneyTransferVC.swift
//  Chaing
//
//  Created by AppleMac on 06/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit
import ObjectMapper

class MoneyTransferVC: UIViewController {
    
    
    @IBOutlet weak var ToTxt : UITextField!
    @IBOutlet weak var ToView : UIView!
    
    
    @IBOutlet weak var ForTxt : UITextField!
    @IBOutlet weak var ForView : UIView!
    
    @IBOutlet weak var amountTxt : UITextField!
    
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
            self.validation()
        }
        
        self.ScanImg.addTap {
            let vc = QRScanerVC.initVC(storyBoardName: .account, vc: QRScanerVC.self, viewConrollerID: .QRScanerVC)
            vc.modalPresentationStyle = .automatic
            self.navigationController?.present(vc, animated: true, completion: nil)
//            self.present(vc: )
        }
        
    }
    
    func validation(){
        guard let amount = self.amountTxt.text, amount.isEmpty != true else {
            showToast(msg: "Transfer atleast $ 1")
            return
        }
        guard let email = self.ToTxt.text, email.isEmpty != true else {
            showToast(msg: "Please Enter your mailid or phonenumber")
            return
        }
        guard let des = self.ForTxt.text, des.isEmpty != true else {
            showToast(msg: "Please Enter Description")
            return
        }
        
        
        var transaction = transactionReq()
        transaction.customer_number = email
        transaction.amount = amount
        transaction.description = des
        self.posttransaction(with: transaction)
    }
    
}




extension MoneyTransferVC : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.TransactionEntity:
                var data = dataDict as? TransactionEntity
                self.push(from: self, ToViewContorller: TapBarViewController.initVC(storyBoardName: .home, vc: TapBarViewController.self, viewConrollerID: .TapBarView))
                
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func posttransaction(with : transactionReq){
        self.presenter?.HITAPI(api: Base.transaction.rawValue, params: convertToDictionary(model: with), methodType: .POST, modelClass: TransactionEntity.self, token: true)
    }
    
}
