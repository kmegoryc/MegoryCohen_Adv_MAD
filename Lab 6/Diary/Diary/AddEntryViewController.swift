//
//  AddEntryViewController.swift
//  Diary
//
//  Created by Keren Megory-Cohen on 4/11/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {
    
    //variables to populate object
    var newDate = String()
    var newSummary = String()
    var newHighlight = String()
    var newLowlight = String()

    @IBOutlet weak var summaryText: UITextView!
    @IBOutlet weak var highlightText: UITextView!
    @IBOutlet weak var lowlightText: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "saveSegue"{
            if summaryText.text?.isEmpty == false {
                //date
                let date = NSDate()
                let dateFormatter = DateFormatter()
                
                //specify how to format date string
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                //assign
                newDate = dateFormatter.string(from: date as Date)
                newSummary = summaryText.text!
                newHighlight = highlightText.text!
                newLowlight = lowlightText.text!
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
