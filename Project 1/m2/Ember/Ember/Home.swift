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
    
    //Overview
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var smoked: UILabel!
    @IBOutlet weak var remaining: UILabel!
    
    @IBOutlet weak var addCigarette: UIButton!
    @IBAction func addCigarette(_ sender: Any) {
        //if addCigarette button is pressed, add cigarette to intake array
        dailyCigaretteCount.intake += 1
        
        //update summary view
        goal.text = String(dailyGoal)
        smoked.text = String(dailyCigaretteCount.intake)
        remaining.text = String((dailyGoal - (dailyCigaretteCount.intake)))
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

