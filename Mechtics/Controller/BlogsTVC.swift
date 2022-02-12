//
//  BlogsTVC.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit
import GoogleMobileAds
class BlogsTVC: UITableViewController, GADFullScreenContentDelegate {
    var bannerView = GADBannerView()
    private var interstitial = GADInterstitialAd()
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
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        addBannerViewToView(bannerView)
        bannerView.rootViewController = self
      
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
    }
    override func viewDidAppear(_ animated: Bool) {
        bannerView.load(GADRequest())
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([

            bannerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bannerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            bannerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                    ])
        
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
        if indexPath.row == blogsArr.count - 1{
            cell.arrow.isHidden = true
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == blogsArr.count - 1{
            
        }else{
            if interstitial != nil {
                interstitial.present(fromRootViewController: self)
              } else {
                print("Ad wasn't ready")
              }
            let vc = storyboard?.instantiateViewController(withIdentifier: "webVC") as! webVC
            vc.navigationItem.title = blogsArr[indexPath.row].name
            vc.url = blogsArr[indexPath.row].url
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
