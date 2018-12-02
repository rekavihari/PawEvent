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


    var host = [Host]()
    var phone: Int = 0
    var email: String = ""

    var nameValues:[String] = ["Tóth Csaba","Marjai Zsolt","Zele Bence"]
    var phoneValues:[String] = ["06305374536","06207468999","06308763948"]
    var emailValues:[String] = ["tcsg.toth@gmail.com","marjai.zsolt@gmail.com","zele.bence@gmail.com"]


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false

        let downloaderService = DownloaderService.shared
        downloaderService.getHosts(completion: { hosts in
            print(hosts)
            self.host.append(contentsOf: hosts)
            self.reloadInputViews()
        })

    }
    
    @IBAction func callTapped(_ sender: Any) {
        let phoneNumber = self.phone
        if let url = URL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func emailTapped(_ sender: Any) {
        let email = self.email
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

        cell.nameLabel.text = host[indexPath.row].name
        cell.emailLabel.setTitle(host[indexPath.row].email,for: .normal)
        guard let emailString = host[indexPath.row].email else {return cell}
        self.email = emailString
        guard let phoneInt = host[indexPath.row].phone else {return cell}
        let x : Int = phoneInt
        let myString = String(x)

        cell.phoneLabel.setTitle(myString,for: .normal)
        self.phone = phoneInt


        /*let viewHeight: CGFloat = view.frame.size.height
         let tableViewContentHeight: CGFloat = tableView.contentSize.height
         let marginHeight: CGFloat = (viewHeight - tableViewContentHeight) / 2.0 )-40

         tableView.contentInset = UIEdgeInsets(top: marginHeight, left: 0, bottom:  -marginHeight, right: 0)*/

        
        return cell
    }





    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let downloaderService = DownloaderService.shared

        downloaderService.getHosts(completion: { hosts in
            self.host = hosts
            tableView.reloadData()
        })
        return host.count
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

    










}


