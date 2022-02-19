//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import Foundation
import UIKit
import MapKit

class WeatherViewModel : NSObject , CLLocationManagerDelegate  {
    
    private var apiService : NetworkService!
    private(set) var empData : Result! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = { }
    var locationUpdated : (() -> ()) = { }
    
    var city = ""
    var locationManger: CLLocationManager!
    var currentlocation: CLLocation?
    
    override init() {
        super.init()
        self.apiService =  NetworkService()
        
        getLocation()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.getWeather { (empData) in
            self.empData = empData
            self.empData?.sortDailyArray()
        } onError: { (eror) in
            print(eror,"Error Printed")
        }
    }
    
    func getLocation() {
       
        if (CLLocationManager.locationServicesEnabled()) {
            locationManger = CLLocationManager()
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestWhenInUseAuthorization()
            locationManger.requestLocation()
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.currentlocation = location
            
            let latitude: Double = self.currentlocation!.coordinate.latitude
            let longitude: Double = self.currentlocation!.coordinate.longitude

            setLatitude(latitude)
            setLongitude(longitude)
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
                if let placemarks = placemarks {
                    if placemarks.count > 0 {
                        let placemark = placemarks[0]
                        if let city = placemark.locality {
                            self.city = city
                            self.locationUpdated()
                        }
                    }
                }
            }
            callFuncToGetEmpData()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManger.requestLocation()
        }
    }

}
