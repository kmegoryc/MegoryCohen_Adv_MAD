//
//  FirstViewController.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    var dailyCigaretteCount = Cigarette()
    var dailyGoal = 20
    var progress : Float = 0.0
    var percentSmoked : Float?
    
    //UIColors
    var lightOrange = UIColor(colorLiteralRed: 225, green: 153, blue: 102, alpha: 1.0)
    var mediumOrange = UIColor(colorLiteralRed: 225, green: 153, blue: 51, alpha: 1.0)
    var lightRed = UIColor(colorLiteralRed: 225, green: 92, blue: 51, alpha: 1.0)
    
    //Overview
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var smoked: UILabel!
    @IBOutlet weak var remaining: UILabel!
    @IBOutlet weak var percentSmokedBar: UIProgressView!
    
    
    @IBOutlet weak var addCigarette: UIButton!
    @IBAction func addCigarette(_ sender: Any) {
        
        //if addCigarette button is pressed, add cigarette to intake array
        dailyCigaretteCount.intake += 1
        
        //update summary view
        goal.text = String(dailyGoal)
        smoked.text = String(dailyCigaretteCount.intake)
        remaining.text = String((dailyGoal - (dailyCigaretteCount.intake)))
        
        //update progress bar
        progress = calculateProgress(smoked: Float(smoked.text!)!, goal: Float(goal.text!)!)
        percentSmokedBar.setProgress(progress, animated: true)
        updatePercentSmokedBarColor()
    }
    
    func calculateProgress(smoked: Float, goal: Float) -> Float {
        print(smoked)
        print(goal)
        percentSmoked = smoked/goal
        print(percentSmoked!)
        return percentSmoked!
    }
    
    func updatePercentSmokedBarColor() {
        if(progress <= 0.33) {
            percentSmokedBar.progressTintColor = UIColor.blue
        }
        else if(progress > 0.33 && progress < 0.66) {
            percentSmokedBar.progressTintColor = UIColor.orange
        }
        else {
            percentSmokedBar.progressTintColor = UIColor.red
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure add cigarette button
        addCigarette.layer.cornerRadius = 35
        addCigarette.clipsToBounds = true
        
        //populate summary view
        goal.text = String(dailyGoal)
        smoked.text = String(dailyCigaretteCount.intake)
        remaining.text = String((dailyGoal - (dailyCigaretteCount.intake)))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

