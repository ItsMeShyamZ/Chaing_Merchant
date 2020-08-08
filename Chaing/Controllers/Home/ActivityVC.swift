//
//  ActivityVC.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
    
    
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var scannerImg : UIImageView!
    @IBOutlet weak var listTableview : UIView!
    @IBOutlet weak var transcationTable : UITableView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var downloadBtn : UIButton!
    @IBOutlet weak var searchTxt : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTableView()
    }
    
    
    func setupView(){
        self.searchView.setCorneredElevation(shadow: 1, corner: 20, color: .gray, clipstobound: .yes)
        self.searchView.layer.borderWidth = 1
        self.searchView.layer.borderColor = UIColor.black.cgColor
        self.listTableview.shaowCorner([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 30)
        self.profileImg.setCorneredElevation(shadow: 1, corner: Int(self.profileImg.frame.width/2), color: .clear)
        self.listTableview.layer.shadowColor = UIColor.gray.cgColor
        self.listTableview.layer.shadowOpacity = 0.5
        self.listTableview.layer.shadowOffset = CGSize(width: 2, height: -4)
        self.listTableview.layer.shadowRadius = CGFloat(2)
        self.listTableview.layer.backgroundColor = UIColor.white.cgColor
    }

}

extension ActivityVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.MessageCell.rawValue, for: indexPath) as! MessageCell
        if indexPath.row == 0{
            cell.nameLbl.setText("Fernando alonso", 20, fontStyle: .bold, isTitle: .yes, textColor: .black)
            cell.price.setText("$ 100", 23, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            cell.dateLbl.setText("16 May", 16, fontStyle: .light, isTitle: .no, textColor: .grayColor)
            cell.msgeLbl.setText("Expired", 16, fontStyle: .light, isTitle: .no, textColor: .grayColor)
        }else if indexPath.row == 1{
            cell.nameLbl.setText("Vicky", 20, fontStyle: .bold, isTitle: .yes, textColor: .black)
            cell.price.setText("$ 400", 23, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            cell.dateLbl.setText("20 May", 15, fontStyle: .light, isTitle: .no, textColor: .grayColor)
            cell.msgeLbl.setText("Cancelled", 15, fontStyle: .light, isTitle: .no, textColor: .grayColor)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func setupTableView(){
        self.transcationTable.delegate = self
        self.transcationTable.dataSource = self
        self.transcationTable.registerCell(withId:cellID.MessageCell)
    }
}
