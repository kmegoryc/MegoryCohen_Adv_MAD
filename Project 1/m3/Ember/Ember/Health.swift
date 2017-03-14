//
//  Health.swift
//  Ember
//
//  Created by Keren Megory-Cohen on 2/27/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class Health: UITableViewController {
    
    @IBOutlet weak var nicotine: UIProgressView!
    @IBOutlet weak var lungCapacity: UIProgressView!
    @IBOutlet weak var lungHairs: UIProgressView!
    @IBOutlet weak var arteries: UIProgressView!
    @IBOutlet weak var heartAttack: UIProgressView!
    @IBOutlet weak var stroke: UIProgressView!
    @IBOutlet weak var lungCancer: UIProgressView!
    
    var recordsData = [String:String]()
    var recordsValues = [String]()
    var recordsKeys = [String]()
    
    var percent : Float = 0.0
    var progress : Float = 0.0
    
    let rfilename = "records.plist"
    
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
    
    func calculateProgress(endured: Float, goal: Float) -> Float {
        if endured < goal {
            percent = endured/goal
        }
        else {
            percent = 1.0
        }
        return percent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100

        
        // RECORDS DATA
        
        var path: String
        
        let filePath = docFilePath(rfilename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath!
        }
        else {
            path = getDataFile(resource: "records", type: "plist")!
        }
        
        //load the data of the plist file into the dictionary
        recordsData = NSDictionary(contentsOfFile: path) as! [String:String]
        //puts all the continents in an array
        recordsKeys = Array(recordsData.keys)
        recordsValues = Array(recordsData.values)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //update progress bars
        
        //nicotine bar
        let oneWeek = 604800
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(oneWeek))
        nicotine.setProgress(progress, animated: true)
        
        //lung capacity bar
        let threeMonths = 7776000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(threeMonths))
        lungCapacity.setProgress(progress, animated: true)
        
        //lung hairs bar
        let nineMonths = 23328000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(nineMonths))
        lungHairs.setProgress(progress, animated: true)
        
        //coronary arteries bar
        let oneYear = 31104000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(oneYear))
        arteries.setProgress(progress, animated: true)
        
        //heart attack bar
        let twoYears = 62208000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(twoYears))
        heartAttack.setProgress(progress, animated: true)
        
        //stroke bar
        let fiveYears = 155520000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(fiveYears))
        stroke.setProgress(progress, animated: true)
        
        let tenYears = 311040000
        progress = calculateProgress(endured: Float(recordsValues[0])!, goal: Float(tenYears))
        lungCancer.setProgress(progress, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
