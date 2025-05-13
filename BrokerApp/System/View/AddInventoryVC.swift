//
//  AddInventoryVC.swift
//  BrokerApp
//
//  Created by Bansi on 25/04/25.
//

import UIKit

class AddInventoryVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var txtBrand: UITextField!
    @IBOutlet weak var txtModel: UITextField!
    @IBOutlet weak var txtRegistrationNumber: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtFuel: UITextField!
    @IBOutlet weak var txtKms: UITextField!
    @IBOutlet weak var txtTransmission: UITextField!
    @IBOutlet weak var txtOwner: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    @IBOutlet weak var imgAdd1: UIImageView!
    @IBOutlet weak var imgAdd2: UIImageView!
    @IBOutlet weak var imgAdd3: UIImageView!
    @IBOutlet weak var imgAdd4: UIImageView!
    
    var imgPicker = UIImagePickerController()
    var selectedImages: [UIImage] = []
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imgAdd1.isUserInteractionEnabled = true
        var tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickAddImage1))
        imgAdd1.addGestureRecognizer(tapGesture)
        imgAdd2.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickAddImage2))
        imgAdd2.addGestureRecognizer(tapGesture)
        imgAdd3.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickAddImage3))
        imgAdd3.addGestureRecognizer(tapGesture)
        imgAdd4.isUserInteractionEnabled = true
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickAddImage4))
        imgAdd4.addGestureRecognizer(tapGesture)
        
        self.imgAdd2.isHidden = true
        self.imgAdd3.isHidden = true
        self.imgAdd4.isHidden = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagedata = info[.originalImage] ?? info[.editedImage] as? UIImage {
            if let image = imagedata as? UIImage {
                if currentImageIndex == 0 {
                    imgAdd1.image = image
                    self.imgAdd2.isHidden = false
                } else if currentImageIndex == 1 {
                    imgAdd2.image = image
                    self.imgAdd3.isHidden = false
                } else if currentImageIndex == 2 {
                    imgAdd3.image = image
                    self.imgAdd4.isHidden = false
                } else {
                    imgAdd4.image = image
                }
                picker.dismiss(animated: true)
            }
        }
    }
    
    @objc func clickAddImage1() {
        currentImageIndex = 0
        openImagePicker()
    }
    
    @objc func clickAddImage2() {
        currentImageIndex = 1
        openImagePicker()
    }
    
    @objc func clickAddImage3() {
        currentImageIndex = 2
        openImagePicker()
    }
    
    @objc func clickAddImage4() {
        currentImageIndex = 3
        openImagePicker()
    }
   
    func openImagePicker() {
        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        imgPicker.delegate = self
        present(imgPicker, animated: true)
    }
    
    @IBAction func clickOnSave(_ sender: Any) {
        let brand = txtBrand.text ?? ""
        let model = txtModel.text ?? ""
        let registrationNumber = txtRegistrationNumber.text ?? ""
        let price = txtPrice.text ?? ""
        let fuel = txtFuel.text ?? ""
        let kms = txtKms.text ?? ""
        let transmission = txtTransmission.text ?? ""
        let owner = txtOwner.text ?? ""
        let year = txtYear.text ?? ""
        let description = txtDescription.text ?? ""
        
        if brand.isEmpty || model.isEmpty || registrationNumber.isEmpty || price.isEmpty || fuel.isEmpty || kms.isEmpty || transmission.isEmpty || owner.isEmpty || year.isEmpty || description.isEmpty {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
        } else {
//            let inventoryVC = UIStoryboard(name: "TabBar", bundle:  nil).instantiateViewController(withIdentifier: "InventoryVC") as! InventoryVC
//            inventoryVC.brand = brand
//            inventoryVC.model = model
//            inventoryVC.registrationNumber = registrationNumber
//            inventoryVC.price = price
//            inventoryVC.fuel = fuel
//            inventoryVC.kms = kms
//            inventoryVC.transmission = transmission
//            inventoryVC.owner = owner
//            inventoryVC.year = year
//            inventoryVC.descriptionText = description
//            if let image = imgAdd1.image {
//                inventoryVC.mainImage = image
//            }
//            self.navigationController?.pushViewController(inventoryVC, animated: true)
                        self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func clickOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension AddInventoryVC {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let clickOnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(clickOnOk)
        self.present(alert, animated: true)
    }
    
}
