//
//  ViewEntryViewController.swift
//  Diary
//
//  Created by Keren Megory-Cohen on 4/11/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class ViewEntryViewController: UIViewController {
    var summary = String()
    var highlight = String()
    var lowlight = String()

    @IBOutlet weak var summaryText: UITextView!
    @IBOutlet weak var highlightText: UITextView!
    @IBOutlet weak var lowlightText: UITextView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        summaryText.text = summary
        highlightText.text = highlight
        lowlightText.text = lowlight
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
