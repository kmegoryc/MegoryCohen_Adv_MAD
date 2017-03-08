//
//  ZodiacCollectionViewController.swift
//  Zodiac
//
//  Created by Keren Megory-Cohen on 3/7/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ZodiacCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let sectionInsets = UIEdgeInsets(top: 25.5, left: 10.0, bottom: 25.0, right: 10.0)
    
    //create array of zodiac class instances for each zodiac symbol
    var zodiacSymbols = [zodiacInfo]()
    
    
    var zodiacName = ["Aquarius", "Pisces", "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn"]
    var zodiacDate = ["Jan 20 - Feb 18", "Feb 19 - Mar 20", "Mar 21 - Apr 19", "Apr 20 - May 20", "May 21 - June 20", "June 21 - July 22", "July 23 - Aug 22", "Aug 23 - Sep 22", "Sep 23 - October 22", "Oct 23 - Nov 21", "Nov 22 - Dec 21", "Dec 22 - Jan 19"]
    var zodiacHoroscope = ["A friend or colleague could introduce you to a way to increase your income by doing what you love most, Aquarius. This may involve the creative arts, healing, or spiritual or metaphysical matters. Although this might take weeks or months of preparation to put into effect, it should be worth the effort. Check out the facts and think about it. If you still like it, go for it!", "Enthusiasm for spiritual and metaphysical studies could have you feeling optimistic about the future. Your physical energy is high, Pisces, and this suggests that you want to try yoga, tai chi, or another discipline that combines physical exercise with developing psychic and spiritual faculties. Friends could want to join you in this activity. Let the insights flow, and write them down.", "Today you might want to host a meeting of your metaphysically inclined friends, Aries. Discussions could lead to insights that none of you would have come up with alone. Your minds will be going a thousand miles an hour. None of you may ever be the same! Don't forget to take notes of your discussions. You won't want to forget a thing you've heard or said.",  "Books or lectures on spiritual or metaphysical matters could inspire you to pursue a subject and perhaps do some writing, Taurus. Contact with friends or colleagues with similar interests could result in fascinating discussions. You might receive some insights about how to pursue your goals more effectively. It will advance you materially as well as intellectually and spiritually.", "A new and previously unacknowledged talent for working in social, humanitarian, or spiritual fields could come to light today, Gemini. This could have you thinking seriously about changing jobs or pursuing an entirely new career. The opportunities are there if you look. If you're serious about this change, it's best to pursue it now. If you wait too long, the process might prove more difficult.", "Increased intuition, imagination, and spiritual insight could inspire you to either undertake a course of study or move ahead with related creative projects, Cancer. You might be very pleasantly surprised at what you learn or produce, and so be motivated to continue with whatever you're doing. This could be an inspiring and productive time for you. Make the most of it!", "Recent new ideas, insights, and visions could motivate you to invite friends with similar interests over today, Leo. You will want to share your experiences, listen to their stories, and try to make sense of it all. This may be an important process, even if some of what's said doesn't seem to make sense. Write down your thoughts and go over them later. ", "An invitation to a social event in your neighborhood could put you in touch with artistic or spiritually inclined people. There could be some fascinating exchanges, Virgo. The event might continue into the night. No matter how late, no matter how tired you are when you get home, try to get a little exercise to clear your head and quiet your mind. You might have trouble getting to sleep otherwise.", "Spiritual insights you received over the past few days could turn your thoughts to serving others. You might have a talent for teaching and choose to share what you've learned in this way, Libra. You should feel especially healthy and energetic, so you may be tempted to plunge ahead. Plan carefully. Even the most admirable of enterprises needs to be faced in a practical frame of mind.", "Romance should pick up speed today, Scorpio. You could discover that you and a current or potential romantic partner have many spiritual interests in common. You might attend some lectures or workshops on one of these subjects together. Take care not to plan too much at once. One or both of you could run into conflicts and end up disappointing the other. Schedule a few and stick to your plans.", "You might have intense dreams and visions tonight that could be almost prophetic, Sagittarius. These premonitions could be personal, but they're apt to be more worldly, such as political events or something in the life of a celebrity you admire. What you sense should be positive, so there are no warnings involved. Write them down so you can verify them later. You might be surprised!", "A lecture given by a magnetic speaker could excite your imagination and interest you in a new and intriguing field, Capricorn. You could also learn about some books on the subject that you want to read. This could give you new motivation to pursue some cherished goals that you've let slide for a while, perhaps inspiring some writing of your own. Friends could prove supportive in this enterprise."]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        //sets the image, name and date for each zodiac symbol
        for i in 0...11 {
            //variable of type zodiac info
            let symbol = zodiacInfo()
            symbol.image = String(i+1)
            symbol.name = zodiacName[i]
            symbol.date = zodiacDate[i]
            symbol.horoscope = zodiacHoroscope[i]
            zodiacSymbols.append(symbol)
        }
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
        return zodiacSymbols.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        let image = UIImage(named: zodiacSymbols[indexPath.row].image)
        let name = zodiacSymbols[indexPath.row].name
        let date = zodiacSymbols[indexPath.row].date
        cell.imageView.image = image
        cell.imageTitle.text = name
        cell.imageLabel.text = date
        
        return cell
    }
    
    //size image
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = UIImage(named: zodiacSymbols[indexPath.row].image)
        let newSize:CGSize = CGSize(width: (image?.size.width)!/5, height:
            (image?.size.height)!/5)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height:
            newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image?.draw(in: rect)
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return (image2?.size)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    //control header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header: CollectionSupplementaryView?
        if kind == UICollectionElementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? CollectionSupplementaryView
            header?.headerLabel.text = "What is your sign?" }
        return header!
    }
    
    //pass data on segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "showDetail"{
        let indexPath = collectionView?.indexPath(for: sender as! CollectionViewCell)
        let detailVC = segue.destination as! DetailViewController
        detailVC.imageName = zodiacSymbols[indexPath!.row].image
        detailVC.imageHoroscope = zodiacSymbols[indexPath!.row].horoscope
        detailVC.imageTitle = zodiacSymbols[indexPath!.row].name
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
