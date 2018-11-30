//
//  ContactViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var nameValues:[String] = ["Tóth Csaba","Marjai Zsolt","Zele Bence"]
    var phoneValues:[String] = ["06305374536","06207468999","06308763948"]
    var emailValues:[String] = ["tcsg.toth@gmail.com","marjai.zsolt@gmail.com","zele.bence@gmail.com"]

    @IBAction func callTapped(_ sender: Any) {
        let phoneNumber = 0036302571405
        if let url = URL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        let email = "info@bikemylake.hu"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell") as! ContactTableViewCell

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 6, y: 6, width: bounds.width-9, height: bounds.height-9), cornerRadius: 10).cgPath
        cell.layer.mask = maskLayer


       

        cell.nameLabel.text = nameValues[indexPath.row]
        cell.phoneLabel.setTitle(phoneValues[indexPath.row],for: .normal)
        cell.emailLabel.setTitle(emailValues[indexPath.row],for: .normal)

        /*let viewHeight: CGFloat = view.frame.size.height
         let tableViewContentHeight: CGFloat = tableView.contentSize.height
         let marginHeight: CGFloat = (viewHeight - tableViewContentHeight) / 2.0 )-40

         tableView.contentInset = UIEdgeInsets(top: marginHeight, left: 0, bottom:  -marginHeight, right: 0)*/

        
        return cell
    }





    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameValues.count
    }

    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0: //For "one"
            segueIdentifier = "showPrograms"
        case 1: //For "two"
            segueIdentifier = "showPrograms"
        default: //For "three"
            segueIdentifier = "showPrograms"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)

    }*/
    func Getdata() {

        let urlstring = URL(string:"http://localhost:8080/api/events")

        guard let url = urlstring else {
            return
        }
        let parameters: Parameters = [
            "username": UserDefaults.standard.getUsername(),
            "password": UserDefaults.standard.getPassword()]
        let headers: HTTPHeaders = ["Authorization":UserDefaults.standard.getToken()]

        Alamofire.request("http://localhost:8080/api/events").responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                if let value = response.result.value {
                    print(response)
                    let json = JSON(value)
                    print(json.arrayValue[0]["name"].stringValue)

                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    )}


    




    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
       // Getdata()


    }





}


