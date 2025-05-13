//
//  LogOutVC.swift
//  BrokerApp
//
//  Created by Bansi on 25/04/25.
//

import UIKit

class LogOutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let overlay = UIView(frame: self.view.bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.insertSubview(overlay, at: 0)
    }
    

    @IBAction func clickOnLogOut(_ sender: Any) {
        let splashVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        self.navigationController?.pushViewController(splashVC, animated: true)
    }
    
    @IBAction func clickOnCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
