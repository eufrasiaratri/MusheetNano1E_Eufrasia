//
//  ViewController.swift
//  Musheet
//
//  Created by Eufrasia Ratri on 27/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Letsgo(_ sender: Any) {
        performSegue(withIdentifier:"ToTabBar", sender: self)
        
        
    }
    
}

