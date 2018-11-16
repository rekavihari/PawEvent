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
    let startDate: Date?
    let endDate: Date?
    let backgroundImageURL: String?
    let competitionID: Int?

    init(id: Int? = nil,
         name: String? = nil,
         description: String? = nil,
         addressDescription: String? = nil,
         iconURL: String? = nil,
         startDate: Date? = nil,
         endDate: Date? = nil,
         backgroundImageURL: String? = nil,
         geoID: Geo? = nil,
         competitionID: Int? = nil) {

        self.id = id
        self.name = name
        self.description = description
        self.addressDescription = addressDescription
        self.iconURL = iconURL
        self.startDate = startDate
        self.endDate = endDate
        self.backgroundImageURL = backgroundImageURL
        self.competitionID = competitionID
    }


}



