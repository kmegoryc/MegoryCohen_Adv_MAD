//
//  QuizViewController.swift
//  GeoQuiz
//
//  Created by Keren Megory-Cohen on 4/4/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var player: AVAudioPlayer? //audio
    
    var score = 0 //current running score
    var total = 0 //total possible points
    
    var selectedContinent : String?
    var totalCountries = [String]()
    var foundCountries = [String]()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldChanged(_ sender: Any) {
        print(textField.text!)
        
        //check if string exists in countries array AND isn't a repeat
        if (totalCountries.contains(textField.text!) && foundCountries.contains(textField.text!) == false) {
            foundCountries.append(textField.text!) //add to found countries array to make sure one doesn't get points for repeating answers
            score = score + 1 //increment score
            scoreLabel.text = String(score) //update score label
            playSound() //play correct sound
            textField.text = nil //clear text field
            
            //check score
            if score == total {
                print("game over")
                gameOver()
            }
        }
        
        else if (totalCountries.contains(textField.text!) && foundCountries.contains(textField.text!)) {
            alreadyEntered()
        }
        else {
            print("either doesn't exist or already entered")
        }
    }
    
    func alreadyEntered() {
        //initialize alert
        let alert = UIAlertController(title: "Error", message: "You already found this country.", preferredStyle: UIAlertControllerStyle.alert)
        
        //create a UIAlertAction object for the button
        let cancelAction = UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancelAction) //add the alert action to the alert object
        present(alert, animated: true, completion: nil)
        print(foundCountries)
    }
    
    func gameOver() {
        //initialize alert
        let alert = UIAlertController(title: "You found them all!", message: "Play again?", preferredStyle: UIAlertControllerStyle.alert)
        
        //create a UIAlertAction object for the button
        let cancelAction = UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancelAction) //add the alert action to the alert object
        
        let yesAction=UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
            self.score = 0 //reset score to 0
            self.foundCountries = [String]() //empty foundCountries array
            self.scoreLabel.text = String(self.score) //update score label
        })
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "ting", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadjson(_ urlPath: String){
        
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
        }
        
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }
            //download successful
            print("download complete")
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do {
            // get json data
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            //get all results
            let allresults = json as! [Any]
            
            //add results to objects
            for result in allresults {
                let newresult = result as! [String: Any]
                guard let country = newresult["name"]
                    else {
                        continue
                    }
                self.totalCountries.append((country as! String).lowercased())
            }
            total = totalCountries.count //set total potential points for selected continent
            totalLabel.text = String(total)
        }
        //handle thrown error
        catch {
            print("Error with JSON: \(error)")
            return
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = selectedContinent //set vc title
        
        loadjson("https://restcountries.eu/rest/v2/region/" + selectedContinent!) //load json each time view appears
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
