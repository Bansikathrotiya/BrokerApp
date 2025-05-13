//
//  HomeVC.swift
//  BrokerApp
//
//  Created by Bansi on 12/04/25.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var segBuyerOrSeller: UISegmentedControl!
    
    @IBOutlet weak var buyer1: UIView!
    @IBOutlet weak var buyer2: UIView!
    
    @IBOutlet weak var seller1: UIView!
    @IBOutlet weak var seller2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.segmentChanged(segBuyerOrSeller)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.buyer1.isHidden = false
            self.buyer2.isHidden = false
            self.seller1.isHidden = true
            self.seller2.isHidden = true 
        } else {
            self.buyer1.isHidden = true
            self.buyer2.isHidden = true
            self.seller1.isHidden = false
            self.seller2.isHidden = false
        }
    }
    
    @IBAction func clickOnSuggest(_ sender: UIButton) {
        let suggestListVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "SuggestListVC") as! SuggestListVC
        self.navigationController?.pushViewController(suggestListVC, animated: true)
    }
    
    @IBAction func clickOnFilter(_ sender: Any) {
        let filterVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        self.present(filterVC, animated: true)
    }
    
}
