//
//  Goals.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 3/13/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Settings: UITableViewController {
    
    var goalsData = [String:String]()
    var goalsValues = [String]()
    var goalsKeys = [String]()
    
    var detailsData = [String:String]()
    var detailsValues = [String]()
    var detailsKeys = [String]()
    
    let gfilename = "goals.plist"
    let dfilename = "details.plist"
    
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
        let filePath1 = docFilePath(gfilename)
        let filePath2 = docFilePath(dfilename)
        let data1 = NSMutableDictionary()
        let data2 = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data1.addEntries(from: goalsData)
        data2.addEntries(from: detailsData)
        //write the contents of the array to our plist file
        data1.write(toFile: filePath1!, atomically: true)
        data2.write(toFile: filePath2!, atomically: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! EditValueViewController
            let editingCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: editingCell)
            targetController.selectedSetting = (indexPath?.row)!
            
            if (indexPath?.section == 0) {
                targetController.title = goalsKeys[indexPath!.row]
            }
            else if (indexPath?.section == 1) {
                targetController.title = detailsKeys[indexPath!.row]
            }
            //send target controller the current section
            targetController.index = (indexPath?.section)!
        }
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="saveSegue"{
        let source = segue.source as! EditValueViewController
            if ((source.newValue.isEmpty) == false){
                if (source.index == 0) {
                    //write new value to goalsData, since goalsData is being recorded in the persistent plist
                    let chosenSetting = Array(goalsData.keys)[source.selectedSetting]
                    goalsData.updateValue(source.newValue, forKey: chosenSetting)
                    
                    //write new value to goalsValues, since this array is being written to table view
                    goalsValues[source.selectedSetting] = source.newValue
                }
                else if (source.index == 1) {
                    //write new value to goalsData, since goalsData is being recorded in the persistent plist
                    let chosenSetting = Array(detailsData.keys)[source.selectedSetting]
                    detailsData.updateValue(source.newValue, forKey: chosenSetting)
                    
                    //write new value to goalsValues, since this array is being written to table view
                    detailsValues[source.selectedSetting] = source.newValue

                }
                
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows: Int = 0
        let numberOfRowsAtSection: [Int] = [goalsData.count, detailsData.count]
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        return rows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        if (indexPath.section == 0) {
            cell.textLabel?.text = goalsKeys[indexPath.row]
            if (indexPath.row == 1) {
                cell.detailTextLabel?.text = (goalsValues[indexPath.row] + " weeks")
            }
            else if (indexPath.row == 3){
                cell.detailTextLabel?.text = (goalsValues[indexPath.row] + " cigarettes a day")
            }
            else {
                cell.detailTextLabel?.text = (goalsValues[indexPath.row] + " cigarettes")
            }
        }
        if (indexPath.section == 1) {
            cell.textLabel?.text = detailsKeys[indexPath.row]
            if (indexPath.row == 0) {
                cell.detailTextLabel?.text = (detailsValues[indexPath.row] + " dollars")
            }
            else {
                cell.detailTextLabel?.text = (detailsValues[indexPath.row] + " cigarettes")
            }
        }
        return cell
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
