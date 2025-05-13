//
//  InventoryVC.swift
//  BrokerApp
//
//  Created by Bansi on 23/04/25.
//

import UIKit

class InventoryVC: UIViewController {

    @IBOutlet weak var hyundaiCreata: UIView!
    
//    @IBOutlet weak var lblBrand: UILabel!
//    @IBOutlet weak var lblModel: UILabel!
//    @IBOutlet weak var lblRegistration: UILabel!
//    @IBOutlet weak var lblPrice: UILabel!
//    @IBOutlet weak var lblFuel: UILabel!
//    @IBOutlet weak var lblKms: UILabel!
//    @IBOutlet weak var lblTransmission: UILabel!
//    @IBOutlet weak var lblOwner: UILabel!
//    @IBOutlet weak var lblYear: UILabel!
//    @IBOutlet weak var lblDescription: UILabel!
//    @IBOutlet weak var carImageView: UIImageView!
    
    
    var brand: String?
        var model: String?
//        var registrationNumber: String?
        var price: String?
        var fuel: String?
        var kms: String?
        var transmission: String?
        var owner: String?
        var year: String?
//        var descriptionText: String?
        var mainImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hyundaiCreata.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hyundaiCreataTapped))
        self.hyundaiCreata.addGestureRecognizer(tapGesture)
        
//        lblBrand.text = brand
//        lblModel.text = model
//        lblRegistration.text = registrationNumber
//        lblPrice.text = price
//        lblFuel.text = fuel
//        lblKms.text = kms
//        lblTransmission.text = transmission
//        lblOwner.text = owner
//        lblYear.text = year
//        lblDescription.text = descriptionText
//        carImageView.image = mainImage
    }
    
    @objc func hyundaiCreataTapped(){
        let inventoryDetailsVC = UIStoryboard(name: "Inventory", bundle: nil).instantiateViewController(withIdentifier: "InventoryDetailsVC") as! InventoryDetailsVC
            
        self.navigationController?.pushViewController(inventoryDetailsVC, animated: true)
    }
    
    @IBAction func clickOnAdd(_ sender: Any) {
        let addInventoryVC = UIStoryboard(name: "Inventory", bundle: nil).instantiateViewController(withIdentifier: "AddInventoryVC") as! AddInventoryVC
        self.navigationController?.pushViewController(addInventoryVC, animated: true)
    }
    
    @IBAction func clickOnDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Do you really want to delete this item?", preferredStyle: .alert)
        let clickOnDelete = UIAlertAction(title: "Delete", style: .destructive) { _ in
            if let button = sender as? UIButton,
               let cardView = button.superview?.superview {
                cardView.removeFromSuperview()
            }
        }
        let clickOnCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(clickOnDelete)
        alert.addAction(clickOnCancel)
        self.present(alert, animated: true)
        
    }
    
}
