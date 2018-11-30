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

                var events: [Event]
                if let response = response {
                    do {
                        events = try JSONDecoder().decode([Event].self, from: response)
                        completion?(events)
                    } catch {
                        print("A dekodolas sikertelen volt.")
                    }
            }
        })
    }

    func getPrograms(completion: (([Program]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.get(endpoint: .program, completion: { response, error in

                var programs: [Program]
                if let response = response {
                    do {
                        programs = try JSONDecoder().decode([Program].self, from: response)
                        completion?(programs)
                    } catch {
                        print("A dekodolas sikertelen volt.")
                    }
                
            }

        })
    }

    func getMessages(completion: (([Message]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.get(endpoint: .message, completion: { response, error in

            var programs: [Message]
            if let response = response {
                do {
                    programs = try JSONDecoder().decode([Message].self, from: response)
                    completion?(programs)
                } catch {
                    print("A dekodolas sikertelen volt.")
                }

            }

        })
    }

    func addLocation(completion: (([Geo]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.post(endpoint: .location, completion: { response, error in

                var locations: [Geo]
                if let response = response {
                    do {
                        locations = try JSONDecoder().decode([Geo].self, from: response)
                        completion?(locations)
                    } catch {
                        print("A dekodolas sikertelen volt.")
                    }
            }
        })
    }
    func addMessage(completion: (([Message]) -> Void)?) {
        let networkService = NetworkService.shared
        networkService.post(endpoint: .location, completion: { response, error in

            if let error = error {
                // hibakezeles
            } else {
                var msg: [Message]
                if let response = response {
                    do {
                        msg = try JSONDecoder().decode([Message].self, from: response)
                        completion?(msg)
                    } catch {
                        print("A dekodolas sikertelen volt.")
                    }
                }
            }

        })
    }
}
