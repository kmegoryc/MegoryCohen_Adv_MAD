//
//  Goals.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Goals: UITableViewController {
    
    var goalsData = [String: String]() //dictionary
    var goalsKeys = [String]() //array
    var goalsValues = [String]() //array
    
    let filename = "goals.plist"
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of continents.plist
        guard let pathString = Bundle.main.path(forResource: "goals", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntries(from: goalsData)
        print(data)
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
        
        let path:String?
        let filePath = docFilePath(filename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath
        }
            
            //otherwise, use the plist in currect directory
        else {
            path = getDataFile()
        }
        
        //loads data from plist into dictionary
        goalsData = NSDictionary(contentsOfFile: path!) as! [String : String]
        //puts all categories into an array
        goalsKeys = Array(goalsData.keys)
        goalsValues = Array(goalsData.values)
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = goalsKeys[indexPath.row]
        print(goalsValues[indexPath.row])
        cell.detailTextLabel?.text = goalsValues[indexPath.row]
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
