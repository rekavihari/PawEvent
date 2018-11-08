//
//  DaysViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dayValues = ["1.nap","2.nap","3.nap","4.nap","5.nap"]
    let dateValues = ["09.18.","09.19.","09.20.","09.21.","09.22."]
    let descriptionValues = ["Welcome on board","Western (Halálos Iramban)","Lucky (Másnaposok)","Ördögűző","Korai amazon"]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "daycell") as! DayTableViewCell

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds

        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 6, y: 6, width: bounds.width-9, height: bounds.height-9), cornerRadius: 10).cgPath

        // cell.layer.mask = maskLayer

        cell.titleLabel.text = dayValues[indexPath.row]
        cell.timeLabel.text = dateValues[indexPath.row]
        cell.descriptionLabel.text = descriptionValues[indexPath.row]

        cell.setTopConstraint(to: indexPath.row == 0)

        /*let viewHeight: CGFloat = view.frame.size.height
        let tableViewContentHeight: CGFloat = tableView.contentSize.height
        let marginHeight: CGFloat = (viewHeight - tableViewContentHeight) / 2.0 )-40

        tableView.contentInset = UIEdgeInsets(top: marginHeight, left: 0, bottom:  -marginHeight, right: 0)*/

        return cell
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayValues.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {



    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutSubviews()
        self.view.layoutIfNeeded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}


