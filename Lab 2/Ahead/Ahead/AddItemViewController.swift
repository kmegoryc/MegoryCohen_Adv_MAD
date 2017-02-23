//
//  AddItemViewController.swift
//  Ahead
//
//  Created by Keren Megory-Cohen on 2/23/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var addedItem = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            //only add a country if there is text in the textfield and doneSegue was pressed
            if ((textField.text?.isEmpty) == false) {
                addedItem=textField.text!
            }
        }
    }
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
