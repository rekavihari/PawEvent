//
//  MessageViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import Alamofire

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let timeValues = ["09.18.17:00","09.18.17:30","09.18.18:00","09.18.19:00","09.19.17:00"]
    let nameValues = ["Tóth Csaba","Tóth Réka","Tóth Panni","Kovács József","Kovács Máté"]
    let messageValues = ["Mikor lesz vacsi?","Hamarosan","Rendben, várjuk","Vacsora változás","Alapanyagok hiányában változtattuk a vacsorán. Köszönjük megértéseteket, babgulyás lesz."]
    let idValues = ["0213","34345","1234","435435","56"]

   
    @IBAction func sendTapped(_ sender: Any) {

       

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "messagecell") as! MessageTableViewCell

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 6, y: 6, width: bounds.width-9, height: bounds.height-9), cornerRadius: 10).cgPath
        cell.layer.mask = maskLayer

        cell.timeLabel.text = timeValues[indexPath.row]
        cell.nameLabel.text = nameValues[indexPath.row]
        cell.messageLabel.text = messageValues[indexPath.row]

        let id = 1234
        if (id==Int(idValues[indexPath.row])) {
            cell.backgroundColor = UIColor( red: CGFloat(180/255.0), green: CGFloat(236/255.0), blue: CGFloat(180/255.0), alpha: CGFloat(1.0) )
            cell.timeLabel.textAlignment = .right
            cell.nameLabel.textAlignment = .right
            cell.messageLabel.textAlignment = .right

        }

        /*let viewHeight: CGFloat = view.frame.size.height
         let tableViewContentHeight: CGFloat = tableView.contentSize.height
         let marginHeight: CGFloat = (viewHeight - tableViewContentHeight) / 2.0 )-40

         tableView.contentInset = UIEdgeInsets(top: marginHeight, left: 0, bottom:  -marginHeight, right: 0)*/

        return cell
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameValues.count
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()



    }

   

}
