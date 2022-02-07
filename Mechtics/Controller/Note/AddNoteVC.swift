//
//  AddNoteVC.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit
import CoreData
class AddNoteVC: UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context = NSManagedObjectContext()
    var note = Note()
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    @IBOutlet weak var viewForNote: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var notetitle: UITextField!
    @IBOutlet weak var noteTxt: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notetitle.setRightPaddingPoints(15)
        notetitle.setLeftPaddingPoints(15)
        notetitle.setPlaceHolderWithColor(.darkGray)
        noteTxt.text = "Note"
        [viewForNote,btnSave,notetitle].forEach({$0?.cornerRadius = 15})
    }
    override func viewWillAppear(_ animated: Bool) {
        self.slideMenuController()?.leftPanGesture?.isEnabled = false
        if note.title == "" && note.note == ""{
            navigationItem.title = "Add Note"
            let formatter = DateFormatter()
            let date = Date()
            formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
            formatter.locale = Locale.current
            lblDate.text = formatter.string(from: date)
        }else{
            navigationItem.title = "Update Note"
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
            lblDate.text = formatter.string(from: note.date)
            noteTxt.text = note.note
            noteTxt.textColor = .black
            notetitle.text = note.title
        }
        navigationController?.navigationItem.hidesBackButton = true
        let backbutton = UIButton(type: .custom)
        backbutton.frame.size.width = 40
        backbutton.setImage(UIImage(named: "ic_back"), for: .normal)
        backbutton.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.slideMenuController()?.leftPanGesture?.isEnabled = true
    }
    @objc func back(){
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func tap_onBtnSave(_ sender: Any) {
        if noteTxt.text == "Note" || noteTxt.text == "" || notetitle.text == ""{
            let alert = UIAlertController(title: "Add Note", message: "Write note title and note first.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            
            
            if note.title == "" && note.note == ""{
                context = appDelegate.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
                let note = NSManagedObject(entity: entity!, insertInto: context)
                note.setValue(notetitle.text, forKey: "title")
                note.setValue(noteTxt.text, forKey: "note")
                note.setValue(Date(), forKey: "date")
                do{
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }catch{
                    debugPrint("Can't save")
                }
            }else{
                updateData(note: note)
            }
        }
    }
    func updateData(note: Note)
    {
        print("Update sucessfully...")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Notes")
        fetchRequest.predicate = NSPredicate(format: "note = %@", note.note)
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(noteTxt.text, forKey: "note")
            objectUpdate.setValue(notetitle.text, forKey: "title")
            do{
                try managedContext.save()
                navigationController?.popViewController(animated: true)
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
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if note.note == ""{
            noteTxt.text = ""
            noteTxt.textColor = .black
            
        }
    }
}
