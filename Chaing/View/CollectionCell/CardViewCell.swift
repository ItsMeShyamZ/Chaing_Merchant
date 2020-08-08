//
//  CardViewCell.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardTypeImg : UIImageView!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var cardsbgView : UIView!
    @IBOutlet weak var cardNum : UILabel!
    @IBOutlet weak var blncLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLang()
        self.setupView()
    }
    
    func setupView(){
        self.cardView.setCorneredElevation(shadow: 2, corner: 20, color: .grayColor,clipstobound: .yes)
        self.cardsbgView.setCorneredElevation(shadow: 0, corner: 20, color: .gray)
        self.cardsbgView.setGradientLayer(colorTop: .primaryColor, colormiddle: .primaryColor, colorBottom: .black)
        [self.cardNum,self.blncLbl].forEach { (lbl) in
            lbl?.textColor = .white
        }
    }
    
    func setupLang(){
        
    }
}
