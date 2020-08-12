
import UIKit
import ObjectMapper


class ViewController: UIViewController {
    
    @IBOutlet weak var skipBtn : UIButton!
    @IBOutlet weak var nextSubmitBtn : UIButton!

    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var contentLbl : UILabel!
    
    @IBOutlet weak var landingImages : UIImageView!
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var contentbgView : UIView!
    
    @IBOutlet weak var pageconroller : UIPageControl!
    
   @objc func handleSwipes(_ sender : UISwipeGestureRecognizer) {
        if sender.direction == .left{
            if !(pageconroller.currentPage < 0) && pageconroller.currentPage <= 1{
                pageconroller.currentPage = pageconroller.currentPage + 1
            }
        }else{
            if !(pageconroller.currentPage > 1) && pageconroller.currentPage >= 0{
                pageconroller.currentPage = pageconroller.currentPage - 1
            }
        }
        self.pageSetupData(index : pageconroller.currentPage)
    }
    
    let titleArray : [String] = [
            "All Service".localize,
            "All Service".localize]
    
    let contentArray : [String] = ["Welcome to DesiclassifiedsFree classifieds free Ads Free Advertisement".localize,
                                   "Welcome to DesiclassifiedsFree classifieds free Ads Free Advertisement".localize
                                ]
    
    let imageArray : [AssetName] = [.launcher1, .launcher2]
       
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.swipGestureInit()
        self.setupAction()
        self.setupView()
               
        self.pageSetupData(index : pageconroller.currentPage)
    }

    func setupView(){
        self.nextSubmitBtn.setCorneredElevation(shadow: 1, corner: 20, color: .primaryColor)
//        self.contentbgView.Elevation = 3
//        self.contentbgView.roundCorners([.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 30)
    }
    
    func swipGestureInit(){
         let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
           let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
           leftSwipe.direction = .left
           rightSwipe.direction = .right
           contentView.addGestureRecognizer(leftSwipe)
           contentView.addGestureRecognizer(rightSwipe)
    }
    
    func setupAction(){
        self.nextSubmitBtn.addTap(Action : {
            self.pageSetupData(index : self.pageconroller.currentPage)
            if !(self.pageconroller.currentPage < 0) && self.pageconroller.currentPage < 1{
                self.pageconroller.currentPage = self.pageconroller.currentPage + 1
            }else if self.pageconroller.currentPage == 1{
                self.moveLauncher()
            }
        })
        
        self.skipBtn.addTap {
            Localizations.instance.setLanguage(languageCode: "en")
            
           self.moveLauncher()
        }
    }
    
    func moveLauncher(){
        UserDefaultConfig.AppState = NavigationOption.launcher.rawValue
        UserDefaultConfig.UserID = ""
       UserDefaultConfig.UserName = ""
       UserDefaultConfig.Token = ""
             
        self.push(from: self, ToViewContorller: LoginVC.initVC(storyBoardName: .account, vc: LoginVC.self, viewConrollerID: .login))
    }
    
    func pageSetupData(index : Int){
        self.titleLbl.text = titleArray[index]
        self.contentLbl.text = contentArray[index]
        if index == 1 {
                 self.nextSubmitBtn.setText("Continue",textColor : UIColor.whiteColor , bgColor : .primaryColor)
            
            self.skipBtn.isHidden = true
        }else{
            self.nextSubmitBtn.setText("Next",textColor : UIColor.whiteColor, bgColor : .primaryColor)
            self.skipBtn.isHidden = false
        }
        self.landingImages.setImage(self.imageArray[index])
        
    }
}





extension ViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        
    }
    
    func showError(error: CustomError) {
        
    }
    
    
}
