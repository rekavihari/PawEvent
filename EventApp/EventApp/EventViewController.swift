//
//  EventViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let imageValues = [UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag"), UIImage(named: "tihanyiapatsag")]
    let nameValues = ["Bike my lake","Balaton Sound","Sziget"]
    let dateValues = ["2017.03.04.-2017.04.05.","2018.03.05.-2018.03.10.","2019.07.19.-2019.07.23."]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell") as! EventTableViewCell

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 6, y: 6, width: bounds.width-9, height: bounds.height-9), cornerRadius: 10).cgPath
        cell.layer.mask = maskLayer

        cell.imageURL.image = imageValues[indexPath.row]
        cell.nameLabel.text = nameValues[indexPath.row]
        cell.dateLabel.text = dateValues[indexPath.row]

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


