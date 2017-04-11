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

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var highlightLabel: UILabel!
    @IBOutlet weak var lowlightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        summaryLabel.text = summary
        highlightLabel.text = highlight
        lowlightLabel.text = lowlight
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
