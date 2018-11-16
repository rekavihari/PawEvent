//
//  UserService.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 09..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class UserService {
    static let sharedInstance = UserService()
    private var manager: SessionManager

    private init() {
        self.manager = Alamofire.SessionManager.default
    }

    
}

