//
//  ItemTblCell.swift
//  TechiebutlerTest
//
//  Created by Rashida on 1/05/24.
//

import UIKit

class ItemTblCell: UITableViewCell {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var lblId : UILabel!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setDataOnCell(_ obj : [String:Any]){
        
        self.mainView.layer.applyCornerRadiusShadow(color: .lightGray,
                                                    alpha: 50,
                                                    x: 0, y: 4,
                                                    blur: 22,
                                                    spread: 0,
                                                    cornerRadiusValue: 6)
        
        
        
        if let title = obj["title"] as? String {
            self.lblTitle.text = title
        }
        
        if let body = obj["body"] as? String {
            self.lblBody.text = body
        }

        
        if let _id = obj["id"] as? Int {
            self.lblId.text = "\(_id)"
        }
        
        
        
        
    }
}
