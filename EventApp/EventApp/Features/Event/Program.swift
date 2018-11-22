//
//  Program.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

struct Program: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let imageURL: String?
    let date: String?
    let startTime: String?
    let endTime: String?
    let eventID: Int?
    let geoID: Int?
    let dayID: Int?
}
