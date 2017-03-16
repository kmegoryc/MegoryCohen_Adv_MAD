//
//  ResortsTableViewController.swift
//  Resorts
//
//  Created by Keren Megory-Cohen on 3/16/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class ResortsTableViewController: UITableViewController {
    
    //make instance of resorts
    var resortList = Resorts()
    var resortURLs = ["https://www.aspensnowmass.com/", "https://www.eldora.com/", "https://www.steamboat.com/", "https://www.snow.com/"]
    
    let kfilename = "resortsinfo.plist"
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of continents.plist
        guard let pathString = Bundle.main.path(forResource: "resortsinfo", ofType: "plist") else {
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
        let filePath = docFilePath(kfilename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntries(from: resortList.resortsData)
        //print(data)
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let path:String?
        
        let filePath = docFilePath(kfilename) //path to data file
        //print(filePath)
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath
        }
        else {
            path = getDataFile()
        }
        
        //load the data of the plist file into the dictionary
        resortList.resortsData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //puts all the continents in an array
        resortList.resorts = Array(resortList.resortsData.keys)
        
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resortList.resortsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = resortList.resorts[indexPath.row]
        return cell
    }
    
    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destination as! DetailTableViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            detailVC.title = resortList.resorts[indexPath.row]
            detailVC.resortListDetail = resortList
            detailVC.selectedResort = indexPath.row
        }
        //for detail disclosure
        if segue.identifier == "infoSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let resort = resortList.resorts[indexPath.row]
                let url = resortURLs[indexPath.row]
                print(resort)
                print(url)
                //let name = resortList.resorts["name"]! as String
                let controller = (segue.destination as! UINavigationController).topViewController as! ResortInfoViewController
                controller.detailItem = url as AnyObject?
                controller.title = resort
                //controller.navigationItem.leftBarButtonItem = self.displayModeButtonItem
                //controller.navigationItem.leftItemsSupplementBackButton = true
                //controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                //controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
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
