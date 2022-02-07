//
//  SidemenuVC.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import SlideMenuControllerSwift

class SidemenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tblMenu: UITableView!
    var vc: UIViewController!
    var hvc: UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.tableFooterView = UIView()
        self.view.backgroundColor = themColor
    }
    override func viewWillAppear(_ animated: Bool) {
        
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
            slideMenuController()?.closeLeft()
            UIApplication.shared.open(URL(string: "https://mechtics.com/general/jobs/")! as URL, options: [:], completionHandler: nil)
        }
        if indexPath.row == 4{
            slideMenuController()?.closeLeft()
            UIApplication.shared.open(URL(string: "https://mechtics.com/general/exams/")! as URL, options: [:], completionHandler: nil)
        }
        if indexPath.row == 5{
            slideMenuController()?.closeLeft()
            UIApplication.shared.open(URL(string: "https://mechtics.com/guest-post/")! as URL, options: [:], completionHandler: nil)
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

