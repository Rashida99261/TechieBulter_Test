//
//  ItemDetailVC.swift
//  TechiebutlerTest
//
//  Created by Rashida on 2/05/24.
//

import UIKit

class ItemDetailVC: UIViewController {
    
    @IBOutlet weak var lblId : UILabel!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    
    var pasItem = [String:Any]()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDataOnview()
        // Do any additional setup after loading the view.
    }
    

    func setDataOnview() {
        if let title = pasItem["title"] as? String {
            self.lblTitle.text = title
        }
        if let body = pasItem["body"] as? String {
            self.lblBody.text = body
        }
        if let _id = pasItem["id"] as? Int {
            self.lblId.text = "\(_id)"
        }
    }
    
    @IBAction func clcikOnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }


}
