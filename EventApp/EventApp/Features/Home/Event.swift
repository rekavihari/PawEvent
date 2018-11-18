//
//  Event.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

struct Event: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let addressDescription: String?
    let iconURL: String?
    let startDate: String?
    let endDate: String?
    let backgroundImageURL: String?
    let competition: String?
}



