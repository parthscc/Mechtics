//
//  webVC.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit
import WebKit
import SlideMenuControllerSwift
class webVC: UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var webviewInstance: WKWebView!
    var url = ""
    var slide = false
    override func viewDidLoad() {
        super.viewDidLoad()
        hudProggess(self.view, Show: true)
        webviewInstance.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webviewInstance.navigationDelegate = self
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationItem.hidesBackButton = true
        let backbutton = UIButton(type: .custom)
        backbutton.frame.size.width = 40
        
        if slide == false{
            backbutton.setImage(UIImage(named: "ic_back"), for: .normal)
            backbutton.addTarget(self, action: #selector(back), for: .touchUpInside)
            self.slideMenuController()?.leftPanGesture?.isEnabled = false
        }else{
            backbutton.setImage(UIImage(named: "ic_side_menu"), for: .normal)
            backbutton.addTarget(self, action: #selector(clickOnMenu), for: .touchUpInside)
            self.slideMenuController()?.leftPanGesture?.isEnabled = true
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
    }
    @objc func clickOnMenu(){
        self.slideMenuController()?.openLeft()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.slideMenuController()?.leftPanGesture?.isEnabled = true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hudProggess(self.view, Show: false)
    }
    @objc func back(){
        navigationController?.popViewController(animated: true)
        
    }
}
