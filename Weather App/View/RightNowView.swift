//
//  DateFormat.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import UIKit

class RightNowView: FancyView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var temLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var feelsLikeLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    
    func clear() {
        dateLabel.text = ""
        cityLabel.text = ""
        weatherLabel.text = ""
        weatherImage.image = nil
        temLabel.text = ""
        feelsLikeLabel.text = ""
        humidityLabel.text = ""
        pressureLabel.text = ""
        feelsLikeLbl.text = ""
        pressureLbl.text = ""
        humidityLbl.text = ""
    }
    
    func updateView(currentWeather: Current, city: String) {
        humidityLbl.text = "Humidity"
        pressureLbl.text = "Pressure"
        feelsLikeLbl.text = "Feels Like"
        cityLabel.text = city
        dateLabel.text = Date.getTodaysDate()
        weatherLabel.text = currentWeather.weather[0].description.capitalized
        print(currentWeather.weather[0].icon)
        weatherImage.image = UIImage(named: currentWeather.weather[0].icon)
        feelsLikeLabel.text = "\(currentWeather.feels_like)"
        temLabel.text = "\(currentWeather.temp)"
        humidityLabel.text = "\(currentWeather.humidity)"
        pressureLabel.text = "\(currentWeather.pressure)"
        
    }

}
