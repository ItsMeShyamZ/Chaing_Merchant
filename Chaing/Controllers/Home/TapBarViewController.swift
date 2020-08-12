//
//  HomeViewController.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

var previousIndex : Int = 0

class TapBarViewController: UIViewController {
    
    
    @IBOutlet weak var pageControllerView : UIView!
    
    @IBOutlet weak var homeImg : UIImageView!
    @IBOutlet weak var homeview : UIView!
    @IBOutlet weak var homeBGview : UIView!
    @IBOutlet weak var homeBtn : UIButton!
    @IBOutlet weak var homeLbl : UILabel!
    
    
    @IBOutlet weak var cardImg : UIImageView!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var cardBgView : UIView!
    @IBOutlet weak var cardBtn : UIButton!
    @IBOutlet weak var cardLbl : UILabel!
    
    @IBOutlet weak var settingImg : UIImageView!
    @IBOutlet weak var settingView : UIView!
    @IBOutlet weak var settingBgView : UIView!
    @IBOutlet weak var settingBtn : UIButton!
    @IBOutlet weak var settingLbl : UILabel!
    
    @IBOutlet weak var logoutImg : UIImageView!
    @IBOutlet weak var logoutView : UIView!
    @IBOutlet weak var logoutBgView : UIView!
    @IBOutlet weak var logoutBtn : UIButton!
    @IBOutlet weak var logoutLbl : UILabel!
    
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var bottomShadowView : UIView!
    

    private var pageController : UIPageViewController?
    private var pendingIndex : Int?
    private var currentIndex : Int = 0
    
    private(set) lazy var ExploresVC : [UIViewController] = {
        return [
            ActivityVC.initVC(storyBoardName: .home, vc: ActivityVC.self, viewConrollerID: .activity),
            MoneyVC.initVC(storyBoardName: .home, vc: MoneyVC.self, viewConrollerID: .Money),
            SettingVC.initVC(storyBoardName: .home, vc: SettingVC.self, viewConrollerID: .Setting)
           
        ]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }

}


extension TapBarViewController{
    
    func initialSetUp(){
        self.setupAction()
        self.setupView()
        self.setupPageController()
        self.setupAnimation()
    }
    
    func setupView(){
        self.homeImg.setImage(.activity, .yes, .gray)
        self.cardImg.setImage(.price, .yes, .gray)
        self.settingImg.setImage(.settings, .yes, .gray)
        self.logoutImg.setImage(.logout, .yes, .gray)
        self.bottomView.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 30)
        self.bottomShadowView.layer.shadowColor = UIColor.gray.cgColor
        self.bottomShadowView.layer.shadowOpacity = 0.5
        self.bottomShadowView.layer.shadowOffset = CGSize(width: 2, height: -5)
        self.bottomShadowView.layer.shadowRadius = CGFloat(3)
        self.bottomShadowView.layer.backgroundColor = UIColor.clear.cgColor
        
       
    }
    
    private func setupPageController(){
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.delegate = self
        self.pageController?.dataSource = self
        self.pageController?.view.backgroundColor = .red
        self.pageController?.view.frame = self.pageControllerView.layer.bounds
        self.addChild(self.pageController!)
        self.pageControllerView.addSubview(self.pageController!.view)
        self.pageController?.isPagingEnabled = false
        
        self.pageController?.didMove(toParent: self)
        self.setVCin(PC: 0)
    }
    
    
    func setupAction(){
        self.cardBtn.addTap {
            if self.currentIndex != 1{
                self.setVCin(PC: 1)
            }
        }
        self.homeBtn.addTap {
            
            if self.currentIndex != 0{
                self.setVCin(PC: 0)
            }
        }
        self.settingBtn.addTap {
            if self.currentIndex != 2{
                self.setVCin(PC: 2)
            }
        }
        self.logoutBtn.addTap {
            if self.currentIndex != 3{
                self.logout()
            }
        }
        
       
    }
    
    
    private func logout() {
        
        let alert = UIAlertController(title: nil, message: "Are you sure want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (_) in
             Navigation.navigateTo(screen: NavigationOption.logout.rawValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.view.tintColor = .primaryColor
        alert.addAction(logoutAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    func setupAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.bottomView.center.y -= self.bottomView.bounds.height
                        self.bottomView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
}

extension TapBarViewController : UIPageViewControllerDataSource , UIPageViewControllerDelegate{
    
    func setVCin(PC index : Int){
        if let firstViewController : UIViewController = ExploresVC[index] {
            self.pageController?.setViewControllers([firstViewController],
                                                    direction: .forward,
                                                    animated: false,
                                                    completion: nil)
            self.setupIndicator(position:  index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ExploresVC.index(of: viewController) else { return nil }
        let previousIndex = VCIndex - 1
        guard previousIndex >= 0 else {return ExploresVC.last}
        guard ExploresVC.count > previousIndex else {return nil}
        return ExploresVC[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ExploresVC.index(of: viewController) else {
            return nil
        }
        let nextIndex = VCIndex + 1
        let orderVCCount = ExploresVC.count
        guard orderVCCount != nextIndex else { return ExploresVC.first }
        guard orderVCCount > nextIndex else { return nil }
        return ExploresVC[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.pendingIndex = ExploresVC.index(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if (completed)
        {
            self.currentIndex = self.pendingIndex!
            self.setupIndicator(position: self.currentIndex)
        }
    }
    
    func setupIndicator(position : Int){
        previousIndex = self.currentIndex
        self.currentIndex = position
        switch position {
            case 0:
                
                self.homeLbl.isHidden = false
                [self.cardLbl,self.settingLbl,self.logoutLbl].forEach { (lbl) in
                    lbl?.isHidden = true
                }
                [self.cardImg,self.settingImg,self.logoutImg].forEach { (img) in
                    img?.changeImgaTint(withTintColor: .gray)
                    self.animateUNSelection(image: img!)
                }
                [self.cardBgView,self.settingBgView,self.logoutBgView].forEach { (views) in
                    views?.backgroundColor = UIColor.white
                }
                self.animateSelection(image: self.homeImg)
                homeImg?.changeImgaTint(withTintColor: .primaryColor)
                self.homeBGview.setCorneredElevation(shadow: 1, corner: 10, color: UIColor.primaryColor.withAlphaComponent(0.2), clipstobound: .yes)
                self.homeBGview.backgroundColor = UIColor.primaryColor.withAlphaComponent(0.2).withAlphaComponent(0.2)
                self.homeLbl.setText("Activity", 13, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            case 1:
                self.cardLbl.isHidden = false
                [self.homeLbl,self.settingLbl,self.logoutLbl].forEach { (lbl) in
                    lbl?.isHidden = true
                }
                [self.homeImg,self.settingImg,self.logoutImg].forEach { (img) in
                    img?.changeImgaTint(withTintColor: .gray)
                    self.animateUNSelection(image: img!)
                }
                [self.homeBGview,self.settingBgView,self.logoutBgView].forEach { (views) in
                    views?.backgroundColor = UIColor.white
                }
                
                self.animateSelection(image: self.cardImg)
                cardImg?.changeImgaTint(withTintColor: .primaryColor)
                self.cardBgView.setCorneredElevation(shadow: 1, corner: 10, color: UIColor.primaryColor.withAlphaComponent(0.2), clipstobound: .yes)
                self.cardBgView.backgroundColor = UIColor.primaryColor.withAlphaComponent(0.2).withAlphaComponent(0.2)
                self.cardLbl.setText("My Card", 13, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            case 2:
                self.settingLbl.isHidden = false
            [self.homeLbl,self.cardLbl,self.logoutLbl].forEach { (lbl) in
                lbl?.isHidden = true
            }
            [self.homeImg,self.cardImg,self.logoutImg].forEach { (img) in
                img?.changeImgaTint(withTintColor: .gray)
                self.animateUNSelection(image: img!)
            }
            [self.homeBGview,self.cardBgView,self.logoutBgView].forEach { (views) in
                views?.backgroundColor = UIColor.white
            }
            
            self.animateSelection(image: self.settingImg)
            settingImg?.changeImgaTint(withTintColor: .primaryColor)
            self.settingBgView.setCorneredElevation(shadow: 1, corner: 10, color: UIColor.primaryColor.withAlphaComponent(0.2), clipstobound: .yes)
            self.settingBgView.backgroundColor = UIColor.primaryColor.withAlphaComponent(0.2).withAlphaComponent(0.2)
            self.settingLbl.setText("Settings", 13, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            
            case 3:
                print("News position33")
            default:
                print("News position")
        }
    }
    
    func animateUNSelection(image : UIView){
        image.alpha = 0
        image.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.2) {
            image.alpha = 1
            image.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 1.0)
        }
    }
    
    func animateSelection(image : UIView){
        image.alpha = 0
        image.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.2) {
            image.alpha = 1
            image.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.8,0.8,0.8)
        }
    }
    
}

extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }
}


extension TapBarViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        
    }
    
    func showError(error: CustomError) {
        
    }
    
    
}
