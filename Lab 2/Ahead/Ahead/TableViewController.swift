//
//  TableViewController.swift
//  Ahead
//
//  Created by Keren Megory-Cohen on 2/23/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let kfilename = "todo.plist"
    //initialize categoriesList of type Categories class
    var categoriesList = Categories()
    
    func getDataFile() -> String? {
        //if pathString is not found by Bundle object, return nil. If it is found, execute everything after the else
        guard let path = Bundle.main.path(forResource: "todo", ofType: "plist") else {
            return nil
        }
        return path
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let path:String?
        let filePath = docFilePath(kfilename) //path to data file
        //print(filePath)
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath
            //print(path)
        }
        else {
            path = getDataFile()
        }
        
        //loads data from todo plist into categoriestList dictionary categoriesData
        categoriesList.categoriesData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //puts all categories into an array
        categoriesList.categories = Array(categoriesList.categoriesData.keys)
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)*/
        
        guard let path = getDataFile() else{
            print("Error loading file")
            return
        }
        //loads data from todo plist into categoriestList dictionary categoriesData
        categoriesList.categoriesData = NSDictionary(contentsOfFile: path) as! [String : [String]]
        //puts all categories into an array
        categoriesList.categories = Array(categoriesList.categoriesData.keys)

        
    }
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        print(dir)
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }

    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(kfilename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntries(from: categoriesList.categoriesData)
        print(data)
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriesSegue" {
        let detailVC = segue.destination as! DetailTableViewController
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        //sets the data for the destination controller
        detailVC.title = categoriesList.categories[indexPath.row] //assigns each lists title to its correpsonding category
        detailVC.todoList = categoriesList //both of class Categories
        detailVC.selectedCategory = indexPath.row //assigns the selected category as the selected row
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //why categoriesData isntead of categories?
        return categoriesList.categoriesData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        //populate each cell with the categories array
        cell.textLabel?.text = categoriesList.categories[indexPath.row]
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
