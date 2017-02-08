//
//  FirstViewController.swift
//  Exercise
//
//  Created by Keren Megory-Cohen on 2/6/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var exercisePicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var calorieEntry: UITextField!
    
    let exerciseCategoryComponent = 0
    let exerciseActivityComponent = 1
    
    var exerciseDictionary = [String: [String]]()
    var category = [String]()
    var activity = [String]()
    
    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == exerciseCategoryComponent {
            return category.count
        }
        else {
            return activity.count
        }
    }
    
    //Picker Delegate methods
    //returns the title for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == exerciseCategoryComponent {
            return category[row]
        }
        else {
            return activity[row]
        }
        
    }
    
    //Called when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //checks which component was picked
        if component == exerciseCategoryComponent {
            let selectedCategory = category[row] //gets the selected artist
            activity = exerciseDictionary[selectedCategory]! //gets the albums for the selected artist
            exercisePicker.reloadComponent(exerciseActivityComponent) //reload the album component
            exercisePicker.selectRow(0, inComponent: exerciseActivityComponent, animated: true) //set the album component back to 0
        }
        let categoryrow = pickerView.selectedRow(inComponent: exerciseCategoryComponent) //gets the selected row for the artist
        let activityrow = pickerView.selectedRow(inComponent: exerciseActivityComponent) //gets the selected row for the album
        
        if (calorieEntry.text == "") {
        choiceLabel.text = "You have developed your skills in '\(category[categoryrow])' by doing the exercise '\(activity[activityrow])'."
        }
        else {
        choiceLabel.text = "You have burned \(calorieEntry.text!) calories and developed your skills in '\(category[categoryrow])' by doing the exercise '\(activity[activityrow])'."
        }
    }

    func getDataFile() -> String? {
        //Use a Bundle object of the directory for our application to retrieve the pathname of exerciselist.plist
        guard let pathString = Bundle.main.path(forResource: "exerciselist", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    //Needed to tap outside of keyboard to close keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        calorieEntry.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let path = getDataFile() else{
            print("Error loading file.")
            return
        }
        
        exerciseDictionary =  NSDictionary(contentsOfFile: path) as! [String:[String]]
        category = Array(exerciseDictionary.keys)
        activity = exerciseDictionary[category[0]]! as [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

