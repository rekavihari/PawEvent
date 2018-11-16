//
//  String.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 13..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation

extension String {
    func utf8DecodedString()-> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return ""
    }

    func utf8EncodedString()-> String? {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8)
        return text
    }
}
