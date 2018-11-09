//
//  Event.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

struct Event {
    let id: Int
    let name: String
    let description: String
    let addressDescription: String
    let iconURL: String
    let startDate: Date
    let endDate: Date
    let backImageURL: String
    let geoID: Int
    let competitionID: Int
}
