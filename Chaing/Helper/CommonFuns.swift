//
//  CommonFuns.swift
//  Gron
//
//  Created by Abservetech on 06/03/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit


enum DateTimeFormate : String{
    case Y_D_M = "yyyy-MM-dd"
    case YMD_T_HHSS = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case dYDM = "EEE,dd MMM yyyy"
    case DMY = "dd MMM YYYY"
    case MY = "MM/YYYY"
    case R_hour = "HH:mm"
    case N_hour = "hh:mm a"
    case date_time = "yyyy-MM-dd HH:mm"
    case date__time = "yyyy-MM-dd-HH:mm"
    case date_N_time = "yyyy-MM-dd hh:mm a"
    case N_date_time = "dd MMM , hh:mm a"
}

func showToast(msg : String ) {
    let window = UIApplication.shared.keyWindow!
    let toastLabel = PaddingLabel()

    toastLabel.backgroundColor = UIColor.blackColor.withAlphaComponent(0.8)
    toastLabel.textColor = UIColor.whiteColor
    toastLabel.translatesAutoresizingMaskIntoConstraints = false
    toastLabel.textAlignment = .center;
    toastLabel.font = UIFont.systemFont(ofSize: 12)
    toastLabel.text = msg
    
    toastLabel.alpha = 1.0
    toastLabel.numberOfLines = 0
    toastLabel.lineBreakMode = .byWordWrapping
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    toastLabel.removeFromSuperview()
    window.addSubview(toastLabel)
    toastLabel.bringSubviewToFront(window)
    NSLayoutConstraint.activate([
        toastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor, constant: 20),
        toastLabel.trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor,constant: -20),
        toastLabel.bottomAnchor.constraint(greaterThanOrEqualTo: window.bottomAnchor, constant:  -15),
        toastLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
        toastLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 150),
        toastLabel.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        
    ])
    UIView.animate(withDuration: 4.0, delay: 0.0, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}

func LoadingShow(view : UIView){
        view.endEditing(true)
       let hud = MBProgressHUD.showAdded(to: view, animated: true)
       hud?.labelText = "Loading..."
       hud?.dimBackground = false
//     AlertBuilder().addView(fromVC: view.parentViewController ?? UIViewController() , AlertLoder.getView).showlodingView()
    
   }
   func LoadingHide(view : UIView){
//    AlertBuilder().addView(fromVC: view.parentViewController ?? UIViewController() , AlertLoder.getView).dismiss()
         MBProgressHUD.hideAllHUDs(for: view, animated: true)
   }


func timeConvertor (time : String , _input: DateTimeFormate, _output: DateTimeFormate) -> String
   {
    if !time.isEmpty{
    var temp = time
    let strArr = time.split{$0 == ":"}.map(String.init)
        var hour : Int = 0
        var min : Int = 0
        if strArr.count >= 1{
            hour = Int(strArr[0]) ?? 0
          
        }
        if strArr.count >= 2{
            hour = Int(strArr[0]) ?? 0
             min = Int(strArr[1]) ?? 0
              
        }
      if(hour > 12){
        
          temp = "\((hour - 12)):\(min) " + "PM"
      }
      else{
          temp = temp + "AM"
      }
      return temp
    }
    return ""
//       let dateFormatter = DateFormatter()
//      dateFormatter.dateFormat = _input.rawValue
//    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: Int(+5.30)) as TimeZone?
//
//       let date = dateFormatter.date(from: time)
//      dateFormatter.dateFormat = _output.rawValue
//       let datestr = dateFormatter.string(from: date ?? Date())
//
//
//       return datestr
   }
   
   func dateConvertor(_ date: String, _input: DateTimeFormate, _output: DateTimeFormate) -> String
   {
       let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = _input.rawValue
       let dates = dateFormatter.date(from: date)
      dateFormatter.dateFormat = _output.rawValue
       let datestr = dateFormatter.string(from: dates ?? Date())
       
       return  dateFormatter.string(from: dates ?? Date())
   }

func strToDate(_ strdate: String, _input: DateTimeFormate, _output: DateTimeFormate) -> Date{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = _input.rawValue
    let date = dateFormatter.date(from: strdate)
    dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
    dateFormatter.dateFormat = _output.rawValue
    return dateFormatter.date(from:strdate) ?? Date()
}

func getcurrentDateTime(formate : DateTimeFormate) -> String{
       let date = Date()
       let formatter = DateFormatter()
      formatter.dateFormat = formate.rawValue
       let result = formatter.string(from: date)
       return result
   }

func getcurrentTime(formate : DateTimeFormate = .N_hour) -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = formate.rawValue
    let result = formatter.string(from: date)
    return result
}

func convertDateformate_24_to12 (_ time : String ,_input: DateTimeFormate, _output: DateTimeFormate) -> String
 {
     let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = _input.rawValue
    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: Int(+5.30)) as TimeZone?
     
     let date = dateFormatter.date(from: time)
     dateFormatter.dateFormat = _output.rawValue
     let datestr = dateFormatter.string(from: date ?? Date())
     
     return datestr
 }
