//
//  AnalyseImage_ViewController.swift
//  AI
//
//  Created by Philips on 23/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class AnalyseImage_ViewController: UIViewController ,UIWebViewDelegate {

    @IBOutlet var analyseView : UIWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red:52.0/255.0 , green: 73.0/255.0, blue:94.0/255.0, alpha: 1.0)

        analyseView?.loadRequest(URLRequest(url: URL(string: "https://azure.microsoft.com/en-gb/services/cognitive-services/emotion/")!))
analyseView?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        return true;
    }
   
     public func webViewDidStartLoad(_ webView: UIWebView)
    {
        print("webViewDidStartLoad")
    }
    
     public func webViewDidFinishLoad(_ webView: UIWebView)
    {
         print("webViewDidFinishLoad")
    }
  
     public func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        print("didFailLoadWithError")
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
