//
//  SidemenuVC.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import SlideMenuControllerSwift
import GoogleMobileAds
class SidemenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource, GADFullScreenContentDelegate{
    @IBOutlet weak var tblMenu: UITableView!
    var vc: UIViewController!
    var hvc: UIViewController!
    private var interstitial = GADInterstitialAd()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.tableFooterView = UIView()
        self.view.backgroundColor = themColor
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad!
            interstitial.fullScreenContentDelegate = self
        }
        )
//        UIView.appearance().backgroundColor = themColor
    }
    override func viewWillDisappear(_ animated: Bool) {
//        UIView.appearance().backgroundColor = .white
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMenu.dequeueReusableCell(withIdentifier: "SlideMenuCell", for: indexPath) as! SlideMenuCell
        cell.name.text = options[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let vc = storyboard!.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 1{
            let vc = storyboard!.instantiateViewController(withIdentifier: "BlogsTVC") as! BlogsTVC
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 2{
            let vc = storyboard!.instantiateViewController(withIdentifier: "NotesVC") as! NotesVC
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 3{
            if interstitial != nil {
                interstitial.present(fromRootViewController: self)
              } else {
                print("Ad wasn't ready")
              }
            let vc = storyboard!.instantiateViewController(withIdentifier: "webVC") as! webVC
            vc.navigationItem.title = "Jobs"
            vc.url = "https://mechtics.com/general/jobs/"
            vc.slide = true
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 4{
            if interstitial != nil {
                interstitial.present(fromRootViewController: self)
              } else {
                print("Ad wasn't ready")
              }
            let vc = storyboard!.instantiateViewController(withIdentifier: "webVC") as! webVC
            vc.navigationItem.title = "Exams"
            vc.url = "https://mechtics.com/general/exams/"
            vc.slide = true
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 5{
            if interstitial != nil {
                interstitial.present(fromRootViewController: self)
              } else {
                print("Ad wasn't ready")
              }
            let vc = storyboard!.instantiateViewController(withIdentifier: "webVC") as! webVC
            vc.navigationItem.title = "Guest post"
            vc.url = "https://mechtics.com/guest-post/"
            vc.slide = true
            self.vc = UINavigationController(rootViewController: vc)
            self.slideMenuController()?.changeMainViewController(self.vc, close: true)
        }
        if indexPath.row == 6{
            slideMenuController()?.closeLeft()
            UIApplication.shared.open(URL(string: "https://mechtics.com/privacy-policy/")! as URL, options: [:], completionHandler: nil)
            
        }
        if indexPath.row == 7{
            slideMenuController()?.closeLeft()
//            UIApplication.shared.open(URL(string: "")! as URL, options: [:], completionHandler: nil)
            
        }
    }
   
}

