//
//  Host.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

struct Host: Decodable{
    let id: Int?
    let name: String?
    let iconURL: String?
    let phone: Int?
    let email: String?
    let eventID: Int?
}
