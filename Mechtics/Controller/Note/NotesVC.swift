//
//  NotesVC.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit
import CoreData
import GoogleMobileAds
class NotesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    var noteArr = [Note]()
    var assNoteArr = [Note]()
    @IBOutlet weak var notesTbl: UITableView!
    @IBOutlet weak var adsView: UIView!
    var bannerView = GADBannerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTbl.tableFooterView = UIView()
        let sidemenu = UIButton(type: .custom)
        sidemenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        sidemenu.setImage(UIImage(named: "ic_side_menu"), for: .normal)
        sidemenu.addTarget(self, action: #selector(clickOnMenu), for: .touchUpInside)
        
        sidemenu.translatesAutoresizingMaskIntoConstraints = false
        sidemenu.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sidemenu.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sidemenu)
        navigationItem.title = "Notes"
        bannerView.adUnitID = bannerID
        addBannerViewToView(bannerView)
        bannerView.rootViewController = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        bannerView.load(GADRequest())
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: adsView.frame.height)
       adsView.addSubview(bannerView)
      }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        notesTbl.reloadData()
    }
    func fetchData(){
        noteArr.removeAll()
        assNoteArr.removeAll()
        context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes");
        request.returnsObjectsAsFaults = false
        do {
            let result = try context!.fetch(request)
            print("Trying to fetch")
            for data in result as! [NSManagedObject] {
                var note = Note()
                note.title = data.value(forKey: "title") as! String
                note.date = data.value(forKey: "date") as! Date
                note.note = data.value(forKey: "note") as! String
                noteArr.append(note)
                print(note)
            }
        } catch {
            print("Failed")
        }
        
        var count = noteArr.count
        while count>0{
            assNoteArr.append(noteArr[count - 1])
            count = count - 1
        }
        //        print(assNoteArr)
    }
    @objc func clickOnMenu(){
        self.slideMenuController()?.openLeft()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assNoteArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notesTbl.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesCell
        cell.title.text = assNoteArr[indexPath.row].title
        cell.desc.text = assNoteArr[indexPath.row].note
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        cell.month.text = formatter.string(from: assNoteArr[indexPath.row].date)
        formatter.dateFormat = "d"
        cell.date.text = formatter.string(from: assNoteArr[indexPath.row].date)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNoteVC") as! AddNoteVC
        vc.note = assNoteArr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let taken = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            let refreshAlert = UIAlertController(title: "Delete Alert", message: "Are you sure ?", preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [self] (action: UIAlertAction!) in
                
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let managedContext = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
                fetchRequest.predicate = NSPredicate(format: "note = %@", assNoteArr[indexPath.row].note)
                do
                {
                    let test = try managedContext.fetch(fetchRequest)
                    
                    let objectToDelete = test[0] as! NSManagedObject
                    managedContext.delete(objectToDelete)
                    
                    do{
                        try managedContext.save()
                        noteArr.remove(at: indexPath.row)
                        assNoteArr.remove(at: indexPath.row)
                        fetchData()
                        notesTbl.reloadData()
                    }
                    catch
                    {
                        print(error)
                    }
                }
                catch
                {
                    print(error)
                }
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
                
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
            completion(true)
        }
        taken.backgroundColor =  UIColor.red
        
        let config = UISwipeActionsConfiguration(actions: [taken])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
   
    @IBAction func btnAddNotes(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNoteVC") as! AddNoteVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
