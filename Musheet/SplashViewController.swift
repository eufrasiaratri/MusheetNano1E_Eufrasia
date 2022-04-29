//
//  SplashViewController.swift
//  Musheet
//
//  Created by Eufrasia Ratri on 29/04/22.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       //wait 2 seconds and go to the next screen
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2 ) {
        self.performSegue(withIdentifier: "Splash", sender: nil)
        }
    }
    


}
