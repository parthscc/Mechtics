//
//  ViewController.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import SlideMenuControllerSwift
class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var blogTbl: UITableView!
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
    override func viewWillAppear(_ animated: Bool) {
//        UIView.appearance().backgroundColor = .white
    }
    @objc func clickOnMenu(){
        self.slideMenuController()?.openLeft()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = blogsArr[indexPath.row]
        let cell = blogTbl.dequeueReusableCell(withIdentifier: "SlideMenuCell", for: indexPath) as! SlideMenuCell
        cell.name.text = data.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: blogsArr[indexPath.row].url)! as URL, options: [:], completionHandler: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func updateViewConstraints() {
        tableHeightConstraint.constant = blogTbl.contentSize.height + 70
        super.updateViewConstraints()
    }

}

