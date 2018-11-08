//
//  MapViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import MapKit



class MapkViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()



    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.showsPointsOfInterest = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()


        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        let sourceCord = locationManager.location?.coordinate
        let destCord = CLLocationCoordinate2D (latitude: 46.7580642, longitude: 17.253708)

        let sourcePlaceMark = MKPlacemark (coordinate: (sourceCord ?? nil)!)
        let destPlaceMark = MKPlacemark (coordinate: destCord)

        let sourceItem = MKMapItem (placemark: sourcePlaceMark)
        let destItem = MKMapItem (placemark: destPlaceMark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .walking

        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in

            guard let response = response  else {
                if let error = error {
                    print("something went wrong")
                }
                return
            }
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)

            let rekt = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rekt), animated: true)
        })
    }

    func mapView (_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.purple
        renderer.lineWidth = 2.0

        return renderer
    }




}

