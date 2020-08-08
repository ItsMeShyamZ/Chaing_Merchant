//
//  MoneyVC.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit

class MoneyVC: UIViewController {
    
    @IBOutlet weak var backImg : UIImageView!
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var addCardBtn : UIButton!
    @IBOutlet weak var addCardLbl : UILabel!
    @IBOutlet weak var cardColection : UICollectionView!
    @IBOutlet weak var BlntitleLbl : UILabel!
    @IBOutlet weak var myCardtitleLbl : UILabel!
    @IBOutlet weak var lastMonthBtn : UIButton!
    @IBOutlet weak var lastMonthLbl : UILabel!
    @IBOutlet weak var lastMonthImg : UIImageView!
    
    
    @IBOutlet weak var addWalletView : UIView!
    @IBOutlet weak var amountTXt : UITextField!
    @IBOutlet weak var amountView : UIView!
    @IBOutlet weak var fiftyLbl : UILabel!
    @IBOutlet weak var hundLbl : UILabel!
    @IBOutlet weak var onefifLbl : UILabel!
    @IBOutlet weak var fiftyView : UIView!
    @IBOutlet weak var hundView : UIView!
    @IBOutlet weak var onefifView : UIView!

    @IBOutlet weak var submitBtn : UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupCollectionView()
    }
    
    func setupView(){
        self.backImg.setImage(.back, .yes, .primaryColor)
        self.lastMonthImg.setImage(.downarrow, .yes, .primaryColor)
        self.submitBtn.setCorneredElevation(shadow: 2, corner: 20, color: .gray)
        self.addWalletView.setCorneredElevation(shadow: 2, corner: 10, color: .gray)
        [self.amountView].forEach { (view) in
            view?.layer.cornerRadius = 15
        }
        [self.fiftyView,self.hundView,self.onefifView].forEach { (lbl) in
            lbl?.layer.cornerRadius = 15
        }
        self.titleLbl.setText("Cash Card", 20, fontStyle: .bold, isTitle: .yes, textColor: .primaryColor)
    }

}

extension MoneyVC : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID.CardViewCell.rawValue, for: indexPath) as! CardViewCell
         
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID.CardViewCell.rawValue, for: indexPath) as! CardViewCell
        return CGSize(width: self.cardColection.frame.width-50, height: 200)
       
        
    }
    
    func setupCollectionView(){
        self.cardColection.delegate = self
        self.cardColection.dataSource = self
        self.cardColection.registerCell(withId: cellID.CardViewCell)
    }
    
    
}
