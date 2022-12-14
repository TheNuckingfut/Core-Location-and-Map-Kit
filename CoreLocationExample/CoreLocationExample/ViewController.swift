//
//  ViewController.swift
//  CoreLocationExample
//
//  Created by ashutosh deshpande on 12/12/2022.
//

import UIKit
import MapKit

struct FavPlaces {
    var lat: Double
    var long: Double
    var name: String
}

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    var myFavPlaces: [FavPlaces] = [
        FavPlaces(lat: 21.1458, long: 79.0882, name: "Nagpur"),
        FavPlaces(lat: 37.0902, long: 95.7129, name: "USA"),
        FavPlaces(lat: 22.3193, long: 114.1694, name: "Hong Kong")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnotationsOnMap()
    }

    func addAnotationsOnMap() {
        for place in myFavPlaces {
            let annot = MKPointAnnotation()
            annot.coordinate.latitude = place.lat
            annot.coordinate.longitude = place.long
            annot.title = place.name
            myMapView.addAnnotation(annot)
        }
    }
}

