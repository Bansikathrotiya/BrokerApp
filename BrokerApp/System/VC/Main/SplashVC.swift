//
//  SplashVC.swift
//  BrokerApp
//
//  Created by Bansi on 03/03/25.
//

import UIKit


class SplashVC: UIViewController {

    @IBOutlet weak var rectangle: UIView!
    
    @IBOutlet weak var btnSignup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        user.set(false, forKey: "IsLogIn")
    }

    @IBAction func clickOnLogin(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

    @IBAction func clickOnSignup(_ sender: UIButton) {
        let registerVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}
