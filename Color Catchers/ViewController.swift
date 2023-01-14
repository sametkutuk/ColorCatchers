//
//  ViewController.swift
//  Color Catchers
//
//  Created by Samet Kutuk on 28.05.2020.
//  Copyright © 2020 Samet Kutuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Label's and button's corners edited
        label1.layer.cornerRadius = 5.0
        label2.layer.cornerRadius = 5.0
        highScoreLabel.layer.cornerRadius = 5.0
        button.layer.cornerRadius = 5.0
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        // this method call high score
       let userDefaults = Foundation.UserDefaults.standard
        // value's value equls called value
       let value = userDefaults.string(forKey: "Record")
        
        // if high score is nil change text 0. this code added for to avoid crash
       if (value == nil) {
           highScoreLabel.text = "0"
           
       } else  {
        // highScoreLabel's text equls value
           highScoreLabel.text = value
           
       }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

