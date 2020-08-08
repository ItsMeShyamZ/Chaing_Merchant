//
//  AlertVC.swift
//  Gron
//
//  Created by Abservetech on 12/03/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit
import Lottie

protocol AlertVCDelegate {
    func dismissView(alertVC : UIViewController)
}

class AlertVC: UIViewController {
  
    
   @IBOutlet weak var bgImageView : UIImageView!
    @IBOutlet weak var alertCancelView : UIView!
    @IBOutlet weak var animationView : AnimationView!
    @IBOutlet weak var loderView : UIView!
    @IBOutlet weak var alertView : UIView!
    @IBOutlet weak var alertViewHeight : NSLayoutConstraint!
    @IBOutlet weak var alertViewLeading : NSLayoutConstraint!
    @IBOutlet weak var alertViewTralling : NSLayoutConstraint!
    var isLoader : YesNoType = .no
    var lodingView : YesNoType = .no
    
    public class func shared() -> AlertVC{
        return AlertVC.initVC(storyBoardName: .main, vc: AlertVC.self, viewConrollerID: .alert)
    }
    
    var subView : UIView = UIView()
    var addedView : UIView = UIView()
    
    func present(){
        if lodingView == .no{
            self.alertView.isHidden = false
            self.loderView.isHidden = true
            self.alertCancelView.blurView()
            self.alertCancelView.isUserInteractionEnabled = true
            
            let addedView = subView.initView(view: self.alertView,vc : self)
            
            self.alertViewHeight.constant = addedView.frame.height > 0.0 ? (addedView.frame.height > 500 ? 500 : addedView.frame.height) : 150
            
            self.alertView.backgroundColor = .whiteColor
            
            self.alertView.setCorneredElevation(clipstobound : .yes)
        }else{
            self.alertView.isHidden = true
            self.loderView.isHidden = false
            self.animationView.loopMode = .loop
            self.animationView.play()
            self.alertCancelView.blurView()
            self.alertCancelView.isUserInteractionEnabled = false
            
            let addedView = subView.initView(view: self.loderView,vc : self)
            
            self.alertViewHeight.constant = addedView.frame.height > 0.0 ? (addedView.frame.height > 500 ? 500 : addedView.frame.height) : 150
            
            self.loderView.backgroundColor = .whiteColor
            
            self.loderView.setCorneredElevation(shadow: 1, corner: Int(self.loderView.bounds.width/2), color: .primaryColor, clipstobound: .yes)
            
        }
        
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        if lodingView != .no{
            self.animationView.stop()
        }
        for subview in alertCancelView.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
        for subview in self.alertView.subviews{
            subview.removeFromSuperview()
        }
        for subview in self.subView.subviews{
            subview.removeFromSuperview()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.present()
        self.setupAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupAction(){
        self.alertCancelView.addTap {
            if self.isLoader == .no {
                self.subView.deInitView(view: self.alertView, vc: self)
                self.dismiss(animated: false, completion: nil)
            }else if self.lodingView == .no {
                self.subView.deInitView(view: self.alertView, vc: self)
                self.dismiss(animated: false, completion: nil)
            }
            
        }
    }

}
