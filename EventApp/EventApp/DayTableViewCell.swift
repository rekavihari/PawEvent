//
//  DayTableViewCell.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewTopLayoutConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.layer.cornerRadius = 6;
        containerView.layer.masksToBounds = true;
    }

    func setTopConstraint(to value: Bool) {
        containerViewTopLayoutConstraint.constant = value == true ? 6 : 0
    }

}
