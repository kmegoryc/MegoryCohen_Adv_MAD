//
//  Goals.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Goals: UITableViewController {
    
    var information = Profile()
    
    //Goals Section
    @IBOutlet weak var startingDailyIntakeCell: UILabel!
    @IBOutlet weak var currentDailyIntakeCell: UILabel!
    @IBOutlet weak var goalDailyIntakeCell: UILabel!
    
    //Details Section
    @IBOutlet weak var cigaretteBrandCell: UILabel!
    @IBOutlet weak var packetSizeCell: UILabel!
    @IBOutlet weak var packetCostCell: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
        
        //goals
        startingDailyIntakeCell.text = String(information.startingDailyIntake)
        currentDailyIntakeCell.text = String(information.currentDailyIntake)
        goalDailyIntakeCell.text = String(information.goalDailyIntake)
        
        //details
        cigaretteBrandCell.text = String(information.cigaretteBrand)
        packetSizeCell.text = String(information.cigarettePacketCost)
        packetCostCell.text = String(information.cigarettePacketCost)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
