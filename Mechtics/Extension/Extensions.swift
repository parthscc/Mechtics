//
//  Extensions.swift
//  MOMINT
//
//  Created by Birendra on 13/09/21.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import MBProgressHUD
let appThemeColor = #colorLiteral(red: 0.1116685048, green: 0.3320159912, blue: 0.5921137333, alpha: 1)

let defaults = UserDefaults.standard
enum RootType {
   
    case  navi
    case  tab
}

struct Font{
    
    static let Rubik_semibold = "Rubik-SemiBold"
    static let Rubik_italic = "Rubik-Italic"
    static let Rubik_medium = "Rubik-Medium"
    static let Rubik_regular = "Rubik-Regular"
}


struct VHkey {
    static let profile_image: String = ""
    static let login : String = "login"
    static let device_token : String = "device_token"
    static let token : String = "token"
    static let email : String = "email"
    static let userID : String = "user_id"
    static let providerID : String = "provider_id"
    static let name : String = "name"
    static let authBearerToken : String = "authBearerToken"
    
}



enum loginType :String {
    
    case apple
    case google
    case emailPassword
}
//MARK: UITextfield
extension UITextField {
    
    func setPlaceHolderWithColor(_ color:UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                        attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
extension UIImageView{
    
    func roundCorner(){
        self.cornerRadius = 15
        self.contentMode = .scaleAspectFill
    }
    
    func round(){
        self.cornerRadius = self.frame.height/2
        self.contentMode = .scaleAspectFill
    }
}
extension UIStackView{
    func setHorizantal(view: UIView){
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 10.0
        self.clipsToBounds = true
        view.clipsToBounds = true
        self.frame = CGRect(x: 0, y: 0, width: view.vWidth, height: view.vHeight)
        self.translatesAutoresizingMaskIntoConstraints = true
       
    }
    func setVertical(view: UIView){
        self.axis = .vertical
        self.distribution = .fillEqually
        
        self.alignment = .center
        self.spacing = 20.0
        
        self.frame = CGRect(x: 0, y: 0, width: view.vWidth, height: view.vHeight)
        self.translatesAutoresizingMaskIntoConstraints = true
        self.clipsToBounds = true
    }
}
//MARK: UITextfield delegate
extension UITextField : UITextFieldDelegate {
    
    func RightIcon(tf_R_Icon rIM:String){
        
        let lView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let setIV = UIImageView(image: UIImage(named: rIM))
        setIV.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        setIV.center = lView.center
        setIV.contentMode = .scaleAspectFit
        lView.addSubview(setIV)
        self.rightView = lView
        self.rightViewMode = .always
        
    }
    func LeftIcon(tf_L_Icon setIName:String){
        
        let lView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 35))
        let setIV = UIImageView(image: UIImage(named: setIName))
        setIV.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        setIV.center = lView.center
        setIV.contentMode = .scaleAspectFit
        lView.addSubview(setIV)
        self.leftView = lView
        
        self.leftViewMode = UITextField.ViewMode.always;
    }
    func setCorner(_ color:UIColor){
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 20.0
        
        let lView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        self.leftView = lView
        self.leftViewMode = UITextField.ViewMode.always;
    }
    
    func roundCorner(){
        layer.cornerRadius = 18
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red:105/255, green:105/255, blue:105/255, alpha: 0.7).cgColor
    }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
extension Date{
    func dateToString(dateFormate:String)-> String {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormate
            let dateString = dateFormatter.string(from: self)
            
            return dateString
        }
}
//MARK: UIButton
extension UIButton{
    
    func roundCorner(){
        layer.cornerRadius = 18
    }
    func shadow(){
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 7.0
        layer.shadowOffset = CGSize(width: 00, height: 0.5)
        layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    func roundButton(){
        layer.cornerRadius = self.layer.frame.height / 2
    }
}
// - - - - - - - - - - - - - - - -
// MARK:- 📍 Extension - UIView 📌
// - - - - - - - - - - - - - - - -

extension UIView {
    
    var vHeight : CGFloat {
        
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    
    var vWidth : CGFloat {
        
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    
    var XPOINT : CGFloat {
        
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    var YPOINT : CGFloat {
        
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    func hideV(){
        self.isHidden = true
    }
    func showV(){
        self.isHidden = false
    }
    
    
    var YH : CGFloat {
        
        return self.frame.origin.y + self.frame.size.height
    }
    
    var XW : CGFloat {
        
        return self.frame.origin.x + self.frame.size.width
    }
    
    var cornerRadius : CGFloat {
        
        get { return  self.layer.cornerRadius }
        set {  self.layer.cornerRadius = newValue }
    }
    
    func applyShadow(radius: CGFloat,
                     opacity: Float,
                     offset: CGSize,
                     color: UIColor = .black) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
    func setBorderAndRadius(){
        
        layer.cornerRadius = 18
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red:105/255, green:105/255, blue:105/255, alpha: 0.7).cgColor
    }
    
    func bottomCornner(){
        
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
    }
    
    func setdropShado() {
        
        let layer = self.layer
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        layer.shadowOpacity = 3.0
        layer.shadowRadius = 3.0
        layer.masksToBounds = false
    }
    
    func setdropShadowithColor(Color:UIColor) {
        
        let layer = self.layer
        layer.shadowColor = Color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        layer.shadowOpacity = 10.0
        layer.shadowRadius = 10.0
        layer.masksToBounds = false
    }
    
    func setShado() {
        
        let layer = self.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 5.0
        layer.masksToBounds = false
    }
    
    func setShadoCell() {
        
        let layer = self.layer
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.shadowOpacity = 0.35
        layer.shadowRadius = 2
        layer.masksToBounds = false
    }
    
    func setShadoWith(color:UIColor) {
        
        
        let layer = self.layer
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2.0
        
        layer.masksToBounds = false
    }
    
}
//MARK: UITextView
extension UITextView : UITextViewDelegate {
    func setCorner(_ color:UIColor){
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 20.0
        
    }
    func roundCorner(){
        layer.cornerRadius = 18
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red:105/255, green:105/255, blue:105/255, alpha: 0.7).cgColor
    }
    
}
//MARK: UISearchbar
extension UISearchBar {
    func getTextField() -> UITextField? { return value(forKey: "searchField") as? UITextField }
    
    func setTextField(color: UIColor) {
        guard let textField = getTextField() else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
}

extension UIViewController {
    
    
    func goBack() {
           
           _ = self.navigationController?.popViewController(animated: true)
       }
       
       func goBackNoAnimation() {
           
           
           _ = self.navigationController?.popViewController(animated: false)
       }
       
       func goBackToRoot() {
           
           _ = self.navigationController?.popToRootViewController(animated: true)
       }
    
    func add(_ child: UIViewController, frame: CGRect? = nil, view: UIView) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = CGRect(x: frame.origin.x, y:frame.origin.y, width: frame.size.width, height: frame.size.height)
        }
        print("childViewframe:",child.view.frame)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
//    func showAlertWithMsg(_ msg:String) {
//        
//        sucessMsg(msg: msg)
//      
//
//    }
//    func showAlertWithWarningMsg(_ msg:String) {
//        
//        warningMsg(msg: msg)
//    }
}

extension String {
    
    func toDictionary() -> [String: AnyObject]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            } catch {
                print(error.localizedDescription)
            }
        }
        return [:]
    }

    func StringToDate(formate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        let date = dateFormatter.date(from: self)

        return date!
    }
    
    
    func stringTo(dateFormate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .autoupdatingCurrent
        dateFormatter.dateFormat = dateFormate
        let date = dateFormatter.date(from: self)
        let dateString = dateFormatter.string(from:date!)

        return dateString
    }
}

extension Int {
    
    func getShopOrderTitleTxt() -> String{
        
        switch self {
        case 4:
            return "Upcoming (from Admin)"
        case 5:
            return "Upcoming (from User)"
        case 6:
            return "Received surfboards"
        case 7:
            return "Repaired surfboards"
        case 9:
            return "History"
        default:
            return ""
        }
    }
    
    func getOrderStatus() -> String { // constant strings - not change
        
        switch self {
        case 0:
            return "Quote pending"
            
        case 1:
            return "Quote received"
            
        case 2:
            return "Order confirm"
            
        case 3:
            return "Ready for pick up scheduled for"
            
        case 4:
            return "Ready for deliver to shop"
            
        case 5:
            return "Ready for drop off at"
            
        case 6:
            return "Repair in progress"
            
        case 7:
            return "Repair completed"
            
        case 8:
            return "Ready for deliver to user"
            
        case 9:
            return "Done"
            
        default:
            return "Pending"
        }
    }
}

func setTextWithLineSpacing(label: UILabel, text: String, lineSpacing: CGFloat) {
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    let attrString = NSMutableAttributedString(string: text)
    attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
    
    label.attributedText = attrString
}

// - - - - - - - - - -
// MARK:- H U D
// - - - - - - - - - -
func hudProggess(_ view:UIView,Show:Bool){

    if Show {

        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.contentColor = UIColor.black
        hud.label.text = "Loading"
    }
    else{

        MBProgressHUD.hide(for: view, animated: true)
    }
}
//
//////MARK:- for set alert message
//
//func sucessMsg(msg: String) {
//
//    let when = DispatchTime.now()
//
//    DispatchQueue.main.asyncAfter(deadline: when) {
//
//        let sucess = MessageView.viewFromNib(layout: .cardView)
//        sucess.configureTheme(.success)
//        sucess.configureDropShadow()
//        sucess.configureContent(title: "", body: msg)
//        sucess.button?.isHidden = true
//
//        var sucessConfig = SwiftMessages.defaultConfig
//        sucessConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
//        sucessConfig.presentationStyle = .bottom
//        SwiftMessages.show(config: sucessConfig, view: sucess)
//    }
//}
//
//func warningMsg(msg: String) {
//
//    let when = DispatchTime.now()
//
//    DispatchQueue.main.asyncAfter(deadline: when) {
//
//        let sucess = MessageView.viewFromNib(layout: .cardView)
//        sucess.configureTheme(.error)
//        sucess.configureDropShadow()
//        sucess.configureContent(title: "", body: msg)
//        sucess.button?.isHidden = true
//
//        var sucessConfig = SwiftMessages.defaultConfig
//        sucessConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
//        sucessConfig.presentationStyle = .bottom
//        SwiftMessages.show(config: sucessConfig, view: sucess)
//
//
//    }
//}
func setRoot(vcName:String, rootType : RootType, tabIndex :Int = 0){
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    switch rootType {
    case .navi:

        let vc = storyboard.instantiateViewController(withIdentifier: vcName) as! UINavigationController
        appDelegate.window?.rootViewController = vc
        break

    case .tab :

        let vc = storyboard.instantiateViewController(withIdentifier: vcName) as! UITabBarController
        vc.selectedIndex = tabIndex
        appDelegate.window?.rootViewController = vc

        break
    }
    
    appDelegate.window?.makeKeyAndVisible()
 
}

func convertDateFromTime(timestamp : String) -> Date {

    let timestamp = timestamp
    var interval:Double = 0

    let parts = timestamp.components(separatedBy: ":")
    for (index, part) in parts.reversed().enumerated() {
        interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
    }

    let date = Date(timeIntervalSince1970: interval)
    return date
}

