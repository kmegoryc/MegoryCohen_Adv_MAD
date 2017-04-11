//
//  MasterTableViewController.swift
//  
//
//  Created by Keren Megory-Cohen on 4/11/17.
//
//

import UIKit
import Firebase

class MasterTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    var entries = [Entry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        ref.observe(FIRDataEventType.value, with: {snapshot in
            self.entries = []
            //FIRDataSnapshot represents the Firebase data at a given time
            //gets all the child data nodes
            for entry in snapshot.children.allObjects as! [FIRDataSnapshot]{
                //create entry object
                let newEntry = Entry(snapshot: entry)
                //add entry to entries array
                self.entries.append(newEntry)
            }
            print(self.entries)
            self.tableView.reloadData()
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)

        let entry = entries[indexPath.row]
        cell.textLabel!.text = entry.date

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = entries[indexPath.row]
            //create a child reference in Firebase where the key value is the recipe name
            let entryref = ref.child(entry.date)
            // Delete the row from Firebase
            entryref.ref.removeValue()
        }
    }

    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        if segue.identifier == "saveSegue" {
            let source = segue.source as! AddEntryViewController
            if source.newSummary.isEmpty == false {
                //create new entry object
                let newEntry = Entry(newdate: source.newDate, newsum: source.newSummary, newhigh: source.newHighlight, newlow: source.newLowlight)
                //add entry to entries array
                entries.append(newEntry)
                //create Dictionary
                let newEntryDict = ["date": source.newDate, "summary": source.newSummary, "highlight": source.newHighlight, "lowlight": source.newLowlight]
                //create a child reference in Firebase where the key value is the entry name
                let entryref = ref.child(source.newDate)
                //write data to Firebase
                entryref.setValue(newEntryDict)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewEntry" {
            let detailVC = segue.destination as! ViewEntryViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let entry = entries[indexPath.row]
            
            //sets the data for the destination controller 
            detailVC.title = entry.date
            detailVC.summary = entry.summary
            detailVC.highlight = entry.highlight
            detailVC.lowlight = entry.lowlight
        }
    }

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
