//
//  SplashVC.swift
//  Gron
//
//  Created by Abservetech on 30/04/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            Navigation.navigateTo(screen: UserDefaultConfig.AppState)
        }
        
    }
    
}
