//
//  EndViewController.swift
//  Color Catchers
//
//  Created by Samet Kutuk on 5.05.2020.
//  Copyright © 2020 Samet Kutuk. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var ScoreData:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        label1.layer.cornerRadius = 5.0
        label2.layer.cornerRadius = 5.0
        button2.layer.cornerRadius = 5.0
        button4.layer.cornerRadius = 5.0
    // Score label's value equals ScoreData (not important be high score)
        scoreLabel.text = ScoreData
        
    }
    
    //This func for sharing 
    @IBAction func share(_ sender: Any) {

        // text to share
        let text = "My score was: \(scoreLabel.text!)"

        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // That iPads won't crash

        // Exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        // Present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
    }
 

}

