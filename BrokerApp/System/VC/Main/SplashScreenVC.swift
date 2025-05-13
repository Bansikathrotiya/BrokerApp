//
//  ViewController.swift
//  BrokerApp
//
//  Created by Bansi on 03/03/25.
//

import UIKit

var user = UserDefaults.standard

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if user.bool(forKey: "IsLogIn"){
                let tabBarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(identifier: "TabBarVC") as! TabBarVC
                self.navigationController?.setViewControllers([tabBarVC], animated: true)
            } else {
                let splashVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
                self.navigationController?.setViewControllers([splashVC], animated: true)
            }
        }
    }


}

