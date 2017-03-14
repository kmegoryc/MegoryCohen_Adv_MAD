//
//  FirstViewController.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {
    
    var goalsData = [String:String]()
    var goalsValues = [String]()
    var goalsKeys = [String]()
    
    var detailsData = [String:String]()
    var detailsValues = [String]()
    var detailsKeys = [String]()
    
    var recordsData = [String:Int]()
    
    var dailyGoal: Int = 0
    var duration = 0
    
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
    
    // GOALS/DETAILS DATA
    
    let gfilename = "goals.plist"
    let dfilename = "details.plist"
    let rfilename = "records.plist"
    
    func getDataFile(resource: String, type: String) -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of continents.plist
        guard let pathString = Bundle.main.path(forResource: resource, ofType: type) else {
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
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(rfilename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntries(from: recordsData)
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    
    @IBAction func addCigarette(_ sender: Any)
    {
        //update daily goal
        dailyGoal = Int(goalsData["Weekly Goal"]!)!
        
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
        recordsData.updateValue(duration, forKey: "timeAtLast")
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
        
        // GOALS/DETAILS DATA
        
        var path1: String?
        let path2: String?
        
        let filePath1 = docFilePath(gfilename) //path to data file
        let filePath2 = docFilePath(dfilename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath1!){
            path1 = filePath1
        }
        if FileManager.default.fileExists(atPath: filePath2!){
            path2 = filePath2
        }
        else {
            path1 = getDataFile(resource: "goals", type: "plist")
            path2 = getDataFile(resource: "details", type: "plist")
        }
        
        //load the data of the plist file into the dictionary
        goalsData = NSDictionary(contentsOfFile: path1!) as! [String:String]
        detailsData = NSDictionary(contentsOfFile: path2!) as! [String:String]
        //puts all the continents in an array
        goalsKeys = Array(goalsData.keys)
        goalsValues = Array(goalsData.values)
        detailsKeys = Array(detailsData.keys)
        detailsValues = Array(detailsData.values)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //calculate time since last cigarette
        let elapsed = Date().timeIntervalSince(dailyCigaretteInfo.timeAtLast as Date)
        duration = Int(elapsed) //total seconds
        
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

