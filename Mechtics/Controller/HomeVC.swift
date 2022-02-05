//
//  ViewController.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import SlideMenuControllerSwift
class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sidemenu = UIButton(type: .custom)
        sidemenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        sidemenu.setImage(UIImage(named: "ic_side_menu"), for: .normal)
        sidemenu.addTarget(self, action: #selector(clickOnMenu), for: .touchUpInside)
        
        sidemenu.translatesAutoresizingMaskIntoConstraints = false
        sidemenu.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sidemenu.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sidemenu)
        navigationItem.title = "Home"
    }
    @objc func clickOnMenu(){
        self.slideMenuController()?.openLeft()
    }


}

