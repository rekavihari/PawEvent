//
//  ProgramCollectionViewCell.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ProgramCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageURL: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   // @IBOutlet weak var indexString: UILabel!




    @IBAction func locationButtonTap(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        //let latitude: CLLocationDegrees = formatter.number(from: latiLabel.text!)!.doubleValue


        //let longitude: CLLocationDegrees = formatter.number(from: longiLabel.text!)!.doubleValue
        let longitude: CLLocationDegrees = 17.708121
        let latitude: CLLocationDegrees = 46.882775

        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Hello"
        mapItem.openInMaps(launchOptions: options)

    }

}
