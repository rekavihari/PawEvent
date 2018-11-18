//
//  EventService.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 18..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation

class DownloaderService {

    static let shared = DownloaderService()

    private init () {}

    func getEvents(completion: (([Event]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.get(endpoint: .events, completion: { response, error in

            if let error = error {
                // hibakezeles
            } else {
                var events: [Event]
                if let response = response {
                    do {
                        events = try JSONDecoder().decode([Event].self, from: response)
                        completion?(events)
                    } catch {
                        print("A dekodolas sikertelen volt.")
                    }
                }
            }

        })
    }

    func getPrograms(completion: (([Program]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.get(endpoint: .program, completion: { response, error in
            print("")
        })
    }
}
