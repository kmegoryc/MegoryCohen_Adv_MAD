//
//  DetailViewController.swift
//  STD
//
//  Created by Keren Megory-Cohen on 3/19/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    var detailItem: AnyObject?
    
    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(_ webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webSpinner.stopAnimating()
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
    
    func loadWebPage(_ urlString: String){
        //the urlString should be a propery formed url //creates a NSURL object
        let url = URL(string: urlString)
        //create a NSURLRequest object
        let request = URLRequest(url: url!)
        //load the NSURLRequest object in our web view
        webView.loadRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //webView.delegate=self
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

