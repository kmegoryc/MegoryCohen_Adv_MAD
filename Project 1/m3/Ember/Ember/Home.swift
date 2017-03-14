//
//  FirstViewController.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Home: UIViewController {
    
    var goalsData = [String:String]()
    var goalsValues = [String]()
    var dailyGoal = 20
    
    var dailyCigaretteInfo = Cigarette()
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

    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!

    @IBOutlet weak var addCigarette: UIButton!
    
    // GOALS DATA
    
    let kfilename = "goals.plist"
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of continents.plist
        guard let pathString = Bundle.main.path(forResource: "goals", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //print(dir)
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }
    
    @IBAction func addCigarette(_ sender: Any) {
        
        //add cigarette to intake array
        dailyCigaretteInfo.intake += 1
        
        //update summary view
        goal.text = String(dailyGoal)
        smoked.text = String(dailyCigaretteInfo.intake)
        remaining.text = String(dailyGoal - (dailyCigaretteInfo.intake))
        
        //update progress bar
        progress = calculateProgress(smoked: Float(smoked.text!)!, goal: Float(goal.text!)!)
        percentSmokedBar.setProgress(progress, animated: true)
        updatePercentSmokedBarColor()
        
        //record current date
        dailyCigaretteInfo.timeAtLast = NSDate()
        print(dailyCigaretteInfo.timeAtLast)
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
        addCigarette.layer.cornerRadius = 22.5
        addCigarette.clipsToBounds = true
        
        //populate summary view
        goal.text = String(dailyGoal)
        smoked.text = String(dailyCigaretteInfo.intake)
        remaining.text = String((dailyGoal - (dailyCigaretteInfo.intake)))
        
        // GOALS DATA
        
        //load plist data
        let path:String?
        
        let filePath = docFilePath(kfilename) //path to data file
        print(filePath)
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath
        }
        else {
            path = getDataFile()
        }
        
        //load the data of the plist file into the dictionary
        goalsData = NSDictionary(contentsOfFile: path!) as! [String:String]
        //puts all the continents in an array
        goalsValues = Array(goalsData.values)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //calculate time since last cigarette
        let elapsed = Date().timeIntervalSince(dailyCigaretteInfo.timeAtLast as Date)
        let duration = Int(elapsed) //total seconds
        
        let seconds = (((duration%86400)%(60*60))%60) //total seconds remainder
        let min = ((duration%86400)%(60*60))/60 //seconds remainder of hours converted to minutes
        let hrs = (duration%86400)/(60*60) //seconds remainder of days converted to hours
        let dys = duration/86400 //total days
        
        minutes.text = (String(min) + ":" +  String(seconds) + " minutes")
        hours.text = (String(hrs) + " hours")
        days.text = (String(dys) + " days")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

