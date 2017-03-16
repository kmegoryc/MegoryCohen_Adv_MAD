//
//  ResortInfoViewController.swift
//  Resorts
//
//  Created by Keren Megory-Cohen on 3/16/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class ResortInfoViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func loadWebPage(_ urlString: String){
        //the urlString should be a propery formed url //creates a NSURL object
        let url = URL(string: urlString)
        //create a NSURLRequest object
        let request = URLRequest(url: url!)
        //load the NSURLRequest object in our web view
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                loadWebPage(detail.description)
            }
        }
    }
    
    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start load")
        webSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("stop load")
        webSpinner.stopAnimating()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
