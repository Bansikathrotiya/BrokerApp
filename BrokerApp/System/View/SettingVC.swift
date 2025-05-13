//
//  SettingVC.swift
//  BrokerApp
//
//  Created by Bansi on 23/04/25.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var logout: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.logout.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logOutTapped))
        self.logout.addGestureRecognizer(tapGesture)
    }
    
    @objc func logOutTapped(){
        let logoutVC = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "LogOutVC") as! LogOutVC
        self.navigationController?.pushViewController(logoutVC, animated: true)
    }

    @IBAction func clickOnPin(_ sender: Any) {
        let newpinVC = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(withIdentifier: "NEWPINVC") as! NEWPINVC
        newpinVC.openedFrom = "setting"
        self.navigationController?.pushViewController(newpinVC, animated: true)
    }
    
    @IBAction func clickOnEdit(_ sender: Any) {
        let vc = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "EditBrokerDetailsVC") as! EditBrokerDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
