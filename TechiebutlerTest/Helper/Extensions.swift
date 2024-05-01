//
//  Extensions.swift
//  TechiebutlerTest
//
//  Created by Rashida on 1/05/24.
//

import Foundation
import UIKit

public extension UIViewController{
    class func getReferenceFromStoryBoard(_ storyBoard: String) -> Self{
        return instantiateFromStoryBoardHelper(storyBoard)
    }
    
    fileprivate class func instantiateFromStoryBoardHelper<T>(_ name:String) -> T{
        let storyBoard = UIStoryboard(name: name, bundle: nil)
        let identifier = String.init(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            print("Action")
        }))
        self.present(alert, animated: true, completion: nil)

    }

}


extension CALayer {
    func applyCornerRadiusShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0,
        cornerRadiusValue: CGFloat = 0)
    {
        cornerRadius = cornerRadiusValue
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
