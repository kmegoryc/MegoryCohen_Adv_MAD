//
//  SecondViewController.swift
//  Exercise
//
//  Created by Keren Megory-Cohen on 2/6/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func healthButton(_ sender: UIButton) {
        
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "x-apple-health://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "x-apple-health://")!, options: [:], completionHandler: nil)
        }
        else {
            //create a UIAlertController object
            let alertHealth=UIAlertController(title: "Cannot open Health at this time.", message: "This may be due to the absence of this app on your device.", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            alertHealth.addAction(cancelAction) //adds the alert action to the alert object
            present(alertHealth, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func fitnessPalButton(_ sender: UIButton) {
        
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "mfp://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "mfp://")!, options: [:], completionHandler: nil)
        }
        else {
            //create a UIAlertController object
            let alertMFP=UIAlertController(title: "Cannot open My Fitness Pal at this time.", message: "This may be due to the absence of this app on your device.", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            alertMFP.addAction(cancelAction) //adds the alert action to the alert object
            present(alertMFP, animated: true, completion: nil)
            
        }
    }
    @IBAction func fitBitButton(_ sender: UIButton) {
        
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "fitbit://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "fitbit://")!, options: [:], completionHandler: nil)
        }
        else {
            //create a UIAlertController object
            let alertFitbit=UIAlertController(title: "Cannot open Fitbit at this time.", message: "This may be due to the absence of this app on your device.", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            alertFitbit.addAction(cancelAction) //adds the alert action to the alert object
            present(alertFitbit, animated: true, completion: nil)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

