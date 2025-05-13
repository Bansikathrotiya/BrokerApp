//
//  OTPVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class OTPVC: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var txtOTP1: UITextField!
    
    @IBOutlet weak var txtOTP2: UITextField!
    
    @IBOutlet weak var txtOTP3: UITextField!
    
    @IBOutlet weak var txtOTP4: UITextField!
    
    var mobileNumber: String?
    var openedFrom: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lblNumber.text = mobileNumber
        
    }
    

    @IBAction func clickOnVerify(_ sender: UIButton) {
        let otp1 = txtOTP1.text ?? ""
        let otp2 = txtOTP2.text ?? ""
        let otp3 = txtOTP3.text ?? ""
        let otp4 = txtOTP4.text ?? ""
        
        if otp1.isEmpty || otp2.isEmpty || otp3.isEmpty || otp4.isEmpty {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else {
            if openedFrom == "register"  {
                let pinNumberVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "PINNumberVC") as! PINNumberVC
                self.navigationController?.pushViewController(pinNumberVC, animated: true)
            } else {
                let newpinVC = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(identifier: "NEWPINVC") as! NEWPINVC
                //            newpinVC.openedFrom == "login"
                self.navigationController?.pushViewController(newpinVC, animated: true)
            }
        }
    }
    
    @IBAction func clickOnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension OTPVC {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
}
