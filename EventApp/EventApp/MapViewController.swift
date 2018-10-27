//
//  MapViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import MapKit



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    var tappedLoc = CLLocationCoordinate2D()



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



        let initialLocation = CLLocation(latitude: 46.761517, longitude: 17.2534798)
        centerMapOnLocation(location: initialLocation)


        // show artwork on map
        let artwork = Artwork(title: "Vihari Réka",
                              locationName: "Waikiki Gateway Park",
                              discipline: "Sculpture",
                              coordinate: CLLocationCoordinate2D(latitude: 46.761517, longitude: 17.2534798))
        mapView.addAnnotation(artwork)

        let artwork2 = Artwork(title: "Tóth Csaba",
                               locationName: "Waikiki Gateway Park",
                               discipline: "Sculpture",
                               coordinate: CLLocationCoordinate2D(latitude: 46.7580642, longitude: 17.253708))
        mapView.addAnnotation(artwork2)







    }

    func mapView (_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.purple
        renderer.lineWidth = 2.0

        return renderer
    }
    func paint() {

        let sourceCord = locationManager.location?.coordinate
        let destCord = CLLocationCoordinate2D (latitude: 46.7580642, longitude: 17.253708)
        let sourcePlaceMark = MKPlacemark (coordinate: (sourceCord ?? nil)!)
        let destPlaceMark = MKPlacemark (coordinate: destCord)

        let sourceItem = MKMapItem (placemark: sourcePlaceMark)
        let destItem = MKMapItem (placemark: destPlaceMark)

        let directionRequest = MKDirections.Request()

        let destPM = MKPlacemark (coordinate: tappedLoc)
        let destITM = MKMapItem (placemark: destPM)

        directionRequest.source = sourceItem
        directionRequest.destination = destITM
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

    let regionRadius: CLLocationDistance = 1800
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }



    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Artwork else { return nil }
        // 3
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        tappedLoc = location.coordinate
        /*let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)*/
        paint()
    }


}

