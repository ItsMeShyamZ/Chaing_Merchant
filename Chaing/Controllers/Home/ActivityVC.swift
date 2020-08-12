//
//  ActivityVC.swift
//  Chaing
//
//  Created by AppleMac on 02/08/20.
//  Copyright © 2020 AppleMac. All rights reserved.
//

import UIKit
import ObjectMapper

class ActivityVC: UIViewController {
    
    
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var scannerImg : UIImageView!
    @IBOutlet weak var listTableview : UIView!
    @IBOutlet weak var transcationTable : UITableView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var downloadBtn : UIButton!
    @IBOutlet weak var searchTxt : UITextField!
    
    var transation : TransactionListEntity = TransactionListEntity()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getTransactionList()
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
        return self.transation.transaction?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.MessageCell.rawValue, for: indexPath) as! MessageCell
            cell.nameLbl.setText((self.transation.transaction?[indexPath.row].customer?.first_name ?? ""), 20, fontStyle: .bold, isTitle: .yes, textColor: .black)
        cell.price.setText("$ \(self.transation.transaction?[indexPath.row].amount ?? 0)", 23, fontStyle: .bold, isTitle: .no, textColor: .primaryColor)
            cell.dateLbl.setText("\(self.transation.transaction?[indexPath.row].transaction_id ?? "")", 16, fontStyle: .light, isTitle: .no, textColor: .grayColor)
            cell.msgeLbl.setText("\(self.transation.transaction?[indexPath.row].description ?? "")", 16, fontStyle: .light, isTitle: .no, textColor: .grayColor)
        
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
extension ActivityVC : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.TransactionListEntity:
                var data = dataDict as? TransactionListEntity
                self.transcationTable.reloadData()
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func getTransactionList(){
        self.presenter?.HITAPI(api: Base.transactionlist.rawValue, params: nil, methodType: .GET, modelClass: TransactionListEntity.self, token: true)
    }
    
}
