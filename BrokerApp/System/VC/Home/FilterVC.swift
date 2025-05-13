//
//  FilterVC.swift
//  BrokerApp
//
//  Created by Bansi on 24/04/25.
//

import UIKit

class FilterVC: UIViewController {
    
    @IBOutlet weak var bottomSheetView: UIView!
    
    @IBOutlet weak var btnFuel: UIButton!
     
    @IBOutlet weak var txtKms: UITextField!
    @IBOutlet weak var txtYears: UITextField!
    @IBOutlet weak var txtFuel: UITextField!
    
    var fuelOptions = ["Petrol", "Diesel", "Electric Power", "CNG"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let overlay = UIView(frame: self.view.bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.insertSubview(overlay, at: 0)
       
        self.bottomSheetView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    @IBAction func clickOnReset(_ sender: Any) {
        self.txtKms.text = ""
        self.txtYears.text = ""
        self.txtFuel.text = ""
    }
    
    @IBAction func clickOnFuel(_ sender: Any) {
        var action : [UIAction] = []
        self.fuelOptions.sort()
        for i in fuelOptions {
            let fuel = UIAction(title: i) { _ in
                self.txtFuel.text = i
            }
            action.append(fuel)
        }
        self.btnFuel.showsMenuAsPrimaryAction = true
        self.btnFuel.menu = UIMenu(children: action)
    }
    
    @IBAction func clickOnClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
