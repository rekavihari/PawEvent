//
//  ContactViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let nameValues = ["Tóth Csaba Gergő","Marjai Zsolt","Zele Bence"]
    let phoneValues = ["06 30 645 86 68","06 20 985 37 56","06 70 345 26 35"]
    let emailValues = ["tcsg.toth@gmail.com","info@bikemylake.hu","zele.bence@gmail.com"]

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactcell") as! ContactTableViewCell

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 6, y: 6, width: bounds.width-9, height: bounds.height-9), cornerRadius: 10).cgPath
        cell.layer.mask = maskLayer

        cell.nameLabel.text = nameValues[indexPath.row]
        cell.phoneLabel.text = phoneValues[indexPath.row]
        cell.emailLabel.text = emailValues[indexPath.row]

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





    override func viewDidLoad() {
        super.viewDidLoad()



    }





}


