//
//  Message.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

struct Message {
    let id: String
    let date: String
    let text: String
    let event: Event
    let sender: User
}
