//
//  SidemenuVC.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import SlideMenuControllerSwift

class SidemenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    
    var options = ["Home","Blogs","Notes","Jobs","Exam","Guest Post","Privacy Policy","Rate us"]

    @IBOutlet weak var tblMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print(indexPath.row)
    }
}

