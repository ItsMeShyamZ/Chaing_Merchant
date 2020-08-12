//
//  SettingVC.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit
import ObjectMapper

class SettingVC: UIViewController {

    @IBOutlet weak var backImg : UIImageView!
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var numLbl : UILabel!
    @IBOutlet weak var upiLbl : UILabel!
    @IBOutlet weak var accountDetailLbl : UILabel!
    @IBOutlet weak var settingTabl : UITableView!
    
    var SettingData : [SettingModel] = [SettingModel]()
    
    func settingList(){
        self.SettingData.append(SettingModel(imageName: .call, title: "Mobile Number", subTitle: "+91 11111111"))
        
        self.SettingData.append(SettingModel(imageName: .payment, title: "Payment Methods", subTitle: "Acc no: bank 3217"))
        
        self.SettingData.append(SettingModel(imageName: .language, title: "Language", subTitle: "English"))
        
        self.SettingData.append(SettingModel(imageName: .notification, title: "Notification", subTitle: "Turn on/off"))
        
        self.SettingData.append(SettingModel(imageName: .security, title: "Security", subTitle: "Google PIN"))
        
        self.SettingData.append(SettingModel(imageName: .logout, title: "Logout", subTitle: "Logout"))
        
        self.SettingData.append(SettingModel(imageName: .help, title: "Help & Feedback", subTitle: ""))
        
        self.SettingData.append(SettingModel(imageName: .terms, title: "Terms , Privacy Policy", subTitle: ""))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getProfile()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingList()
        self.setupView()
        self.setupTableView()
    }
    
    func setupView(){
        self.backImg.setImage(.back, .yes, .primaryColor)
        self.titleLbl.setText("Settings", 20, fontStyle: .bold, isTitle: .yes, textColor: .primaryColor)
        
    }

    func setupDate(data : ProfileEntity){
        if let profile : ProfileEntity = data{
            self.nameLbl.text = (data.first_name ?? "") + " " + "\(data.last_name ?? "")"
            self.numLbl.text = "\(data.email ?? "")"
              self.upiLbl.text = "\(data.mobile ?? "")"
        }
    }
}

extension SettingVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SettingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.SettingCell.rawValue, for: indexPath) as! SettingCell
        cell.Img.image = UIImage(named:  self.SettingData[indexPath.row].imageName!.rawValue)
        cell.titleLbl.setText(self.SettingData[indexPath.row].title, 20, fontStyle: .bold, isTitle: .yes, textColor: .black)
         cell.subTitle.setText(self.SettingData[indexPath.row].subTitle, 15, fontStyle: .regular, isTitle: .no, textColor: .gray)
        cell.subTitle.isHidden = self.SettingData[indexPath.row].subTitle.isEmpty
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func setupTableView(){
        self.settingTabl.delegate = self
        self.settingTabl.dataSource = self
        self.settingTabl.registerCell(withId:cellID.SettingCell)
    }
}

struct SettingModel {
    var imageName : AssetName?
    var title: String = ""
    var subTitle : String = ""
}
extension SettingVC : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.ProfileEntity:
                var data = dataDict as? ProfileEntity
                self.setupDate(data: data!)
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func getProfile(){
        self.presenter?.HITAPI(api: Base.profile.rawValue, params: nil, methodType: .GET, modelClass: ProfileEntity.self, token: true)
    }
    
}
