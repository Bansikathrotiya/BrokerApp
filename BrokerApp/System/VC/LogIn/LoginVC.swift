//
//  LoginVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var txtPinNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func clickOnLogin(_ sender: UIButton) {
        let number = txtNumber.text ?? ""
        let pinNumber = txtPinNumber.text ?? ""
        
        if number.isEmpty || pinNumber.isEmpty {
            setAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else {
            let tabBarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            self.navigationController?.setViewControllers([tabBarVC], animated: true)
        }
    }
    
    @IBAction func clickOnSignup(_ sender: UIButton) {
        let registerVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    @IBAction func clickOnForgotPINNumber(_ sender: UIButton) {
        let pinForgotVC = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(withIdentifier: "PINForgotVC") as! PINForgotVC
        self.navigationController?.pushViewController(pinForgotVC, animated: true)
    }
}

extension LoginVC {
    
    func setAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
}
