//
//  PINForgotVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class PINForgotVC: UIViewController {

    @IBOutlet weak var txtNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickOnContinue(_ sender: UIButton) {
        let number = txtNumber.text ?? ""
        
        if number.isEmpty {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else if number.count != 10 {
            showAlert(title: "Invalid Number", message: "Please enter a valid 10-digit mobile number.")
        } else {
            let otpVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "OTPVC") as! OTPVC
    //        otpVC.openedFrom = "login"
            otpVC.mobileNumber = txtNumber.text
            self.navigationController?.pushViewController(otpVC, animated: true)
        }
    }
    
    @IBAction func clickOnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PINForgotVC {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
}

