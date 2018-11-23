//
//  HomeViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import MapKit
import Kingfisher


class HomeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!

    var event = [Event]()
    let locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.clipsToBounds = false
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor( red: CGFloat(217/255.0), green: CGFloat(242/255.0), blue: CGFloat(249/255.0), alpha: CGFloat(1.0) )
        navigationBarAppearace.shadowImage = nil
        navigationBarAppearace.tintColor = .black


        // Downloading
        let downloaderService = DownloaderService.shared
        downloaderService.getEvents(completion: { events in
            self.event.append(contentsOf: events)
            print(events)
            self.setUpView()
        })



        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        guard let sourceCord = locationManager.location?.coordinate, CLLocationCoordinate2DIsValid(sourceCord) else{
            print("Forrás koordináta üres!")
            return
        }
        let latiSource = sourceCord.latitude
        let longiSource = sourceCord.longitude
        UserDefaults.standard.setLatitude(value: latiSource)
        UserDefaults.standard.setLongitude(value: longiSource)

        let locdownloaderService = DownloaderService.shared

        locdownloaderService.addLocation(completion: { geos in
            print(geos)
        })



      
    }

    @IBAction func logoutTapped(_ sender: Any) {
        handleSignOut()
    }

    func setUpView() {
        nameLabel.text = event[0].name
        startLabel.text = event[0].startDate
        endLabel.text = event[0].endDate
        guard let iconString = event[0].iconURL else { return }
        guard let url = URL(string: iconString) else { return }
        iconImage.kf.setImage(with: url)

    
    }


   /* func Getdata() {

        let urlstring = URL(string:"http://localhost:8080/api/events")

        guard let url = urlstring else {
            return
        }
        let parameters: Parameters = [
            "username": UserDefaults.standard.getUsername(),
            "password": UserDefaults.standard.getPassword()]
        let headers: HTTPHeaders = ["Authorization":UserDefaults.standard.getToken()]

        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in

            switch response.result {
            case .success(let value):
                if let value = response.result.value {
                    print(response)
                    let json = JSON(value)
                    print(json.arrayValue[0]["name"].stringValue)
                    self.nameLabel.text = json.arrayValue[0]["name"].stringValue
                    self.startLabel.text = json.arrayValue[0]["startDate"].stringValue
                    self.endLabel.text = json.arrayValue[0]["endDate"].stringValue
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }*/

   /* func startReceivingSignificantLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            return
        }

        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            // The service is not available.
            return
        }
        locationManager.delegate = self
        locationManager.startMonitoringSignificantLocationChanges()
    }*/

    func handleSignOut() {
        UserDefaults.standard.setisLoggedIn(value: false)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "loginNaviVC")
        self.present(controller, animated: true, completion: nil)
    }
  
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Hide the navigation bar on the this view controller
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            // Show the navigation bar on other view controllers
            self.navigationController?.setNavigationBarHidden(false, animated: animated)

    }

}
