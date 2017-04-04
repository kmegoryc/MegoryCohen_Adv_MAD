//
//  ContinentsCollectionViewController.swift
//  GeoQuiz
//
//  Created by Keren Megory-Cohen on 4/4/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ContinentsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var continents = [continentInfo]()
    var continentNames = ["Africa", "Asia", "Oceania", "Europe", "Americas"]
    var continentAmount = ["60", "50", "27", "53", "57"]
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 40.0, bottom: 50.0, right: 40.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        for i in 1...5 {
            let continent = continentInfo()
            continent.image = String(i)
            continent.name = continentNames[i-1]
            continent.amount = continentAmount[i-1]
            continents.append(continent)
        }
        //print(continents)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return continentNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: continents[indexPath.row].image)
        let name = continents[indexPath.row].name
        let amount = continents[indexPath.row].amount
        cell.continentName.text = name
        cell.imageView.image = image
        cell.numberOfCountries.text = amount + " countries"
        
        return cell
    }
    
    //size image
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = UIImage(named: continents[indexPath.row].image)
        let newSize:CGSize = CGSize(width: (image?.size.width)!/20, height:
            (image?.size.height)!/20)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height:
            newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image?.draw(in: rect)
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return (image2?.size)!
    }
    
    //set insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    
    //pass data on segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "showQuiz"{
        let indexPath = collectionView?.indexPath(for: sender as! CollectionViewCell)
        let detailVC = segue.destination as! QuizViewController
        detailVC.selectedContinent = continents[indexPath!.row].name
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
