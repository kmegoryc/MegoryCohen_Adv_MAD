//
//  EditValueViewController.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 3/13/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class EditValueViewController: UIViewController {
    
    var newValue = String()
    var selectedSetting = 0
    var index = 0
    
    @IBOutlet weak var editValue: UITextField!
    
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
            //only add a country if there is text in the textfield
            if ((editValue.text?.isEmpty) == false){
                newValue = editValue.text!
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
