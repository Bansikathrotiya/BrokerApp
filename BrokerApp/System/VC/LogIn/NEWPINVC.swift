//
//  NEWPINVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class NEWPINVC: UIViewController {

    @IBOutlet weak var txtPinNumber: UITextField!

    @IBOutlet weak var txtConfirmPinNumber: UITextField!
    
    var openedFrom: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clikOnConfirmPIN(_ sender: UIButton) {
        let pinNumber = txtPinNumber.text ?? ""
        let confirmPinNumber = txtConfirmPinNumber.text ?? ""
        
        if pinNumber.isEmpty || confirmPinNumber.isEmpty {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else if pinNumber != confirmPinNumber {
            showAlert(title: "Wrong PIN", message: "Pins do not match. Please correct it.")
        } else if pinNumber.count < 6 || confirmPinNumber.count < 6 {
            showAlert(title: "Invalid Number", message: "Please enter a valid 6-digit PIN.")
        } else {
            if openedFrom == "setting" {
                self.navigationController?.popViewController(animated: true)
            } else {
                let tabBarVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                self.navigationController?.pushViewController(tabBarVC, animated: true)
            }
        }
    }
    
    @IBAction func clickOnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension NEWPINVC {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
}
