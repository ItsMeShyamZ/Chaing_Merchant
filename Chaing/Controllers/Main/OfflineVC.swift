//
//  OfflineVC.swift
//  Gron
//
//  Created by Abservetech on 05/03/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class OfflineVC: UIViewController {

    
    @IBOutlet weak var bgImageView : UIImageView!
    @IBOutlet weak var viewTopConstrain : NSLayoutConstraint!
    @IBOutlet weak var offlineView : UIView!
    
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var contentLbl : UILabel!
    @IBOutlet weak var retryBtn : UIButton!
    
    
    var bgImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.retryBtn.setCorneredElevation(color : UIColor.whiteColor)
        self.retryBtn.setText("Retry", 20, .bold, textColor: .whiteColor, bgColor: .primaryColor)
        self.titleLbl.setText("_offline_title", 17, fontStyle: .bold, isTitle: .yes, textColor: .blackColor)
        self.contentLbl.setText("_offline_content", 17, fontStyle: .regular, isTitle: .no, textColor: .grayColor)
        self.offlineView.shaowCorner([.layerMinXMinYCorner , .layerMaxXMinYCorner], radius: 20, shadow: 5)
      //  self.setupAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.checkReacblity()
        self.setupAction()
    }
    
    
    func setupAction(){
        self.retryBtn.addTap {
            self.checkReacblity()
        }
    }
    
    func checkReacblity(){
//        if Reachability().isConnectedToNetwork(){
//            self.dismiss(animated: true, completion: nil)
//        }else{
//            Log.e("No interner")
//        }
    }
    
    func setupAnimation(){
        let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        
        UIView.animate(withDuration: 2, delay: 0.5, options: [.curveEaseIn],
                       animations: {
                        self.bgImageView.image = self.bgImage
                        self.viewTopConstrain.constant = ((safeAreaHeight ?? 0) + (bottomPadding ?? 0)) / 2.0
                        self.bgImageView.alpha = 0.5
                        self.offlineView.backgroundColor = UIColor.primaryColor
                        self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    

}
