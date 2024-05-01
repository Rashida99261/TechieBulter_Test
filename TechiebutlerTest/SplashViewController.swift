//
//  SplashViewController.swift
//  TechiebutlerTest
//
//  Created by Rashida on 1/05/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.moveToNext()
        }
    }

    func moveToNext(){
        let login = ListViewController.getReferenceFromStoryBoard("Main")
        self.navigationController?.pushViewController(login, animated: true)
    }
    

}
