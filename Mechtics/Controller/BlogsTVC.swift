//
//  BlogsTVC.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit

class BlogsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let sidemenu = UIButton(type: .custom)
        sidemenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        sidemenu.setImage(UIImage(named: "ic_side_menu"), for: .normal)
        sidemenu.addTarget(self, action: #selector(clickOnMenu), for: .touchUpInside)
        
        sidemenu.translatesAutoresizingMaskIntoConstraints = false
        sidemenu.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sidemenu.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sidemenu)
        navigationItem.title = "Blogs"
      
    }
    @objc func clickOnMenu(){
        self.slideMenuController()?.openLeft()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogsArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogsCell", for: indexPath) as! BlogsCell

        cell.lbl.text = blogsArr[indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "webVC") as! webVC
        vc.navigationItem.title = blogsArr[indexPath.row].name
        vc.url = blogsArr[indexPath.row].url
        navigationController?.pushViewController(vc, animated: true)
    }

}
