//
//  GameViewController.swift
//  Color Catchers
//
//  Created by Samet Kutuk on 4.05.2020.
//  Copyright © 2020 Samet Kutuk. All rights reserved.
//

import UIKit
import AVFoundation // this framework added for play sound

class GameViewController: UIViewController {
    
    //Defined Labels and buttons
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    //This labels type shakeLabel. It was created this type for capable of animation label
    @IBOutlet weak var colorLabel: shakeLabel!
    @IBOutlet weak var timeLabel: shakeLabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // This labels type shakeButton. It was created this type for capable of animation button
    @IBOutlet weak var darkGrayButton: shakeButton!
    @IBOutlet weak var lightGrayButton: shakeButton!
    @IBOutlet weak var button2: shakeButton!
    @IBOutlet weak var button3: shakeButton!
    @IBOutlet weak var button1: shakeButton!
    
    // This variable created for playing sound
    var clickedTrue = AVAudioPlayer()
    var clickedFalse = AVAudioPlayer()
    var finishGame = AVAudioPlayer()
    var addTime = AVAudioPlayer()
    var gamemusic = AVAudioPlayer()
    
    // TapInt is created for count true click
    var tapInt = 0
    // StartInt start game timers variable
    var startInt = 3
    // StartTimer variable is created for timer
    var startTimer = Timer()
    // GameInt created for assign game time
    var gameInt = 15
    // GameTimer variable is created for timer
    var gameTimer = Timer()
    // Created for count hit score
    var hitScore = 0
    // Created for record score on phone
    var recordData:String!
    
    // This variables created for dinamic colors
    var darkGrayColor = UIColor.darkGray
    var lightGrayColor = UIColor.lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // This block when game starting stay dinamic color
    colorLabel.backgroundColor = lightGrayColor        
    lightGrayButton.backgroundColor = lightGrayColor
    darkGrayButton.backgroundColor = darkGrayColor
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
    // Label's and button's corners edited
    label1.layer.cornerRadius = 5.0
    label2.layer.cornerRadius = 5.0
    darkGrayButton.layer.cornerRadius = 5.0
    lightGrayButton.layer.cornerRadius = 5.0
    darkGrayButton.frame = CGRect(x: 16, y: 442, width: 150, height: 162)
    lightGrayButton.frame = CGRect(x: 203, y: 443, width: 150, height: 162)
    // TapInt value is set to 0
    tapInt = 0
    // Score label's value set to actual value
    scoreLabel.text = String(tapInt)
        
    // StartInt value is set to 3
    startInt = 3
    // DarkGrayButton's title counting down
    darkGrayButton.setTitle(String(startInt), for: .normal)
    // When counting down button not working
    darkGrayButton.isEnabled = false
        
    // LightGrayButton's title counting down
    lightGrayButton.setTitle(String(startInt), for: .normal)
    // When counting down button not working
    lightGrayButton.isEnabled = false
    
    // When the game starts the time falls 1 second
    startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTimer), userInfo: nil, repeats: true)
        
    // Game Time value is set to 15
    gameInt = 15
    // Time label's text set actual value
    timeLabel.text = String(gameInt)
        
    // User's score assign recordData variables for record and comparison (highScore)
    let userDefaults = Foundation.UserDefaults.standard
    let value = userDefaults.string(forKey: "Record")
    recordData = value
        
    // Which sound play created assign this block
        do {
            clickedTrue = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "clickTrue", ofType: ".mp3")!))
            clickedTrue.prepareToPlay()
            
            clickedFalse = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "clickFalse", ofType: ".mp3")!))
            clickedFalse.prepareToPlay()
            
            finishGame = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "finishGame", ofType: ".mp3")!))
            finishGame.prepareToPlay()
            
            addTime = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "addTime", ofType: ".mp3")!))
            addTime.prepareToPlay()
            
            gamemusic = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "doxent_-_Forgotten_Land", ofType: ".mp3")!))
            gamemusic.prepareToPlay()
        }
            
    // If music player not work this block catch it
        catch {
            print(error)
        }
    // Game Music Start when pres start game button
        gamemusic.play()

    }
    
    // This button is the button on the left of the screen.
    @IBAction func darkGrayButton(_ sender: Any) {
        let score:Int? = Int(scoreLabel.text!)
    // If colors label equals darkGrayButton do this block
        if colorLabel.backgroundColor == darkGrayButton.backgroundColor {
            
    // Add 1 score
            tapInt += 1
    // Updates ScoreLabel's text
            scoreLabel.text = String(tapInt)
    // Play clicked true sound
            clickedTrue.play()
    
    // This block takes momentary seconds
            let date = Date()
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.nanosecond], from: date)
    // This line assigns seconds to the variable variable
            let millis = components.nanosecond
    
    // This block declare red, green and blue colors by random
            let redValue = CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            let blueValue = CGFloat(drand48())
            colorLabel.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 1.0)
            lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.4)
            button1.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.6)
            if score! > 20{
            // If current millis mode 2 equals 0 do it
                        if (millis! % 2 == 0){

                        darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
                    
                    else if(millis! % 3 == 0) {
                        lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
                    else{
                        button1.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
            }
            else{
                // If current millis mode 2 equals 0 do it
                            if (millis! % 2 == 0){

                            darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                        }
                        
                            else{
                            lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                        }
            }
    // If user clicked true hit score +1
            hitScore = hitScore + 1
    // Update color label text for hit score
            colorLabel.text = String(hitScore)

    // If hit score mode 10 equals 0
            if hitScore % 10 == 0 {
    // Shake time label
                timeLabel.shakeLabel()
    // Play addTime sound
                addTime.play()
    // Add gameInt +5
                gameInt = gameInt+5
    // Hit score value equals 0
                hitScore = 0
    // Update color label text
                colorLabel.text = String(hitScore)
            }
        }
    // If color not match
        else  {
    // Shake darkGrayButton
            darkGrayButton.shake()
    // GameInt values decrase 1
            gameInt = gameInt-1
    // Hit score value equals 0
            hitScore = 0
    // Play clickedFalse sound
            clickedFalse.play()
    // Update color label text
            colorLabel.text = String(hitScore)

        }
        
}
        
    
    
    // This button is the button on the right of the screen. And all code same like darkGrayButton comments
    @IBAction func lightGrayButton(_ sender: Any) {
        let score:Int? = Int(scoreLabel.text!)
        
        if colorLabel.backgroundColor == lightGrayButton.backgroundColor {
        tapInt += 1
        scoreLabel.text = String(tapInt)
            
        clickedTrue.play()

            let date = Date()
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.nanosecond], from: date)
    // This line assigns seconds to the variable variable
            let millis = components.nanosecond
    
    // This block declare red, green and blue colors by random
            let redValue = CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            let blueValue = CGFloat(drand48())
            colorLabel.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 1.0)
            darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.3)
            button1.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.6)
    // If current millis mode 2 equals 0 do it
            
            if score! > 20 {
                if (millis! % 2 == 0){
                        lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            }
            else if(millis! % 3 == 0) {
                    darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            }
            else{
                        button1.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            }
        }
                else {
                    if (millis! % 2 == 0){
                lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
                        else{
                            darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                        }
            }
            
            hitScore = hitScore + 1
            colorLabel.text = String(hitScore)

            if hitScore % 10 == 0 {
                timeLabel.shakeLabel()
                addTime.play()
                hitScore = 0
                gameInt = gameInt+5
                colorLabel.text = String(hitScore)

            }
    }
        else {

            lightGrayButton.shake()
            gameInt = gameInt-1
            hitScore = 0
            clickedFalse.play()
            colorLabel.text = String(hitScore)

        }

    }
    
    @IBAction func button1(_ sender: Any) {
                
        if colorLabel.backgroundColor == button1.backgroundColor {
        tapInt += 1
        scoreLabel.text = String(tapInt)
            
        clickedTrue.play()

            let date = Date()
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.nanosecond], from: date)
    // This line assigns seconds to the variable variable
            let millis = components.nanosecond
    
    // This block declare red, green and blue colors by random
            let redValue = CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            let blueValue = CGFloat(drand48())
            colorLabel.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 1.0)
            darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.2)
            lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue,  alpha: 0.6)

            // If current millis mode 2 equals 0 do it
                        if (millis! % 2 == 0){

                        button1.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
                    
                    else if(millis! % 3 == 0) {
                        darkGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
                    else{
                        lightGrayButton.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
                    }
            hitScore = hitScore + 1
            colorLabel.text = String(hitScore)

            if hitScore % 10 == 0 {
                timeLabel.shakeLabel()
                addTime.play()
                hitScore = 0
                gameInt = gameInt+5
                colorLabel.text = String(hitScore)

            }
    }
        else {
            button1.shake()
            gameInt = gameInt-1
            hitScore = 0
            clickedFalse.play()
            colorLabel.text = String(hitScore)

        }

    }
    
    // This func when game starting counts down
    @objc func startGameTimer() {
    
            startInt -= 1
        darkGrayButton.setTitle(String(startInt), for: .normal)
        lightGrayButton.setTitle(String(startInt), for: .normal)
        
    // If startInt is equal to 0 and stop counting buttons are activated
        if startInt == 0 {
            startTimer.invalidate()
            darkGrayButton.setTitle(" ", for: .normal)
            darkGrayButton.isEnabled = true
            lightGrayButton.setTitle(" ", for: .normal)
            lightGrayButton.isEnabled = true
    // gameTimers counting starts
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.game), userInfo: nil, repeats: true)
        }
    }
    
    // This func count down game counter. And comparisons score and high score
    @objc func game(){
           gameInt -= 1
           timeLabel.text = String(gameInt)
        let score:Int? = Int(scoreLabel.text!)

                if gameInt <= 3{
                    timeLabel.shakeLabel()
            
                }
        if score! > 20{
           // darkGrayButton.isHidden = true
           // lightGrayButton.isHidden = true
           //  button1.isHidden = false
           //  button2.isHidden = false
            darkGrayButton.frame = CGRect(x: 16, y: 442, width: 100, height: 162)
            lightGrayButton.frame = CGRect(x: 135, y: 443, width: 100, height: 162)
            button1.frame = CGRect(x: 254, y: 443, width: 100, height: 162)

            //darkGrayButton.frame.size.width=5
            button1.isHidden = false

        }
                if gameInt <= 0 {
                    finishGame.play()
                    gamemusic.stop()
            
                        if gameInt < 0 {
                            timeLabel.text = "0"
                            gameTimer.invalidate()
                        }
                        if recordData == nil {
                            let savedString = scoreLabel.text
                            let userDefaults = Foundation.UserDefaults.standard
                            userDefaults.set(savedString, forKey: "Record")
                        }
               else {
                            let record:Int? = Int(recordData)
                   
                       if score! > record! {
                               let savedString = scoreLabel.text
                               let userDefaults = Foundation.UserDefaults.standard
                               userDefaults.set(savedString, forKey: "Record")

                       }
                
               }
               
                            darkGrayButton.isEnabled = false
                            lightGrayButton.isEnabled = false

                            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
           }
       }
       
    // This func when game is end and if score > high score. ScoreDate's value = scorelabel value
       @objc func end() {
           
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "gameEnd") as! EndViewController
           
           vc.ScoreData = scoreLabel.text
           
           self.present(vc, animated: false, completion: nil)
           
    
       }
    

}
