//
//  RegisterVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var txtCity: UITextField!
     
    @IBOutlet weak var txtCompanyName: UITextField!
    
    @IBOutlet weak var txtxAddress: UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var imgFlag: UIImageView!
    
    @IBOutlet weak var btnFlag: UIButton!
    
    @IBOutlet weak var btnCity: UIButton!
    
    @IBOutlet weak var btnTerms: UIButton!
    
    var isTermsAccepted = false
    
    var countryOptions = ["India", "Canada", "Brazil", "Swedish", "UK", "USA"]
    
    var cityOptions = ["Surat", "Ahemdabad", "Delhi", "Mumbai", "Bangalore", "Chennai" , "Kolkata", "Pune", "Jaipur", "Goa", "Hyderabad", "Toronto", "Montreal", "Edmonton", "Calgary", "Vancouver", "Ottawa", "Winnipeg", "Rio de Janeiro", "Fortaleza" , "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clickOnTerms(_ sender: UIButton) {
        isTermsAccepted.toggle()
        if isTermsAccepted {
            btnTerms.setImage(UIImage(systemName: "checkmark"), for: .normal)
            btnTerms.tintColor = .color222222
        } else {
            btnTerms.setImage(UIImage(), for: .normal)
        }
    }
    
    @IBAction func clickOnCity(_ sender: UIButton) {
        self.setCityDropDown()
    }
    
    @IBAction func clickOnFlag(_ sender: UIButton) {
        self.setFlagDropDown()
    }
    
    @IBAction func clickOnSignup(_ sender: UIButton) {
        let name = txtCompanyName.text ?? ""
        let city = txtCity.text ?? ""
        let number = txtNumber.text ?? ""
        let address = txtxAddress.text ?? ""
        
        if name.isEmpty || city.isEmpty || number.isEmpty || address.isEmpty {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else if number.count != 10 {
            showAlert(title: "Invalid Number", message: "Please enter a valid 10-digit mobile number.")
        } else {
            let otpVC = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(identifier: "OTPVC") as! OTPVC
            otpVC.openedFrom = "register"
            otpVC.mobileNumber = txtNumber.text
            self.navigationController?.pushViewController(otpVC, animated: true)
        }
    }
    
    @IBAction func clickOnLogin(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "LogIn", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func clickOnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
    func setCityDropDown(){
        var action : [UIAction] = []
        self.cityOptions.sort()
        for i in cityOptions {
            let city = UIAction(title: i) {_ in
                self.txtCity.text = i
            }
            action.append(city)
        }
        self.btnCity.showsMenuAsPrimaryAction = true
        self.btnCity.menu = UIMenu(title: "Select City" , children: action)
    }
    
    func setFlagDropDown(){
        var action : [UIAction] = []
        self.countryOptions.sort()
        for i in countryOptions {
            let flag = UIAction(title: i) { _ in
                self.imgFlag.image = UIImage(named: i)
            }
            action.append(flag)
        }
        self.btnFlag.showsMenuAsPrimaryAction = true
        self.btnFlag.menu = UIMenu(title: "Select Country", children: action)
    }
    
}
