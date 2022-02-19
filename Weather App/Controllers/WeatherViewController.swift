//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import UIKit
import MapKit

class WeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var rightNowView: RightNowView!
    @IBOutlet weak var weatherTableView: UITableView!
    
    private var employeeViewModel : WeatherViewModel  =  WeatherViewModel()
    
    private var dataSource : WeatherTableViewDatasource<WeatherTableViewCell,Daily>!

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        self.employeeViewModel.locationUpdated = {
            self.getWeather()
        }
    }
    
    func clearAll() {
        rightNowView.clear()
    }
    //2
    func getWeather() {
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateViews()
        }
    }
    
    func updateViews() {
        updateTopView()
    }
    
    func updateTopView() {
        guard let weatherResult = employeeViewModel.empData else {
            return
        }
        rightNowView.updateView(currentWeather: weatherResult.current, city: employeeViewModel.city)
        updateDataSource()
    }
    
    @IBAction func getWeatherTapped(_ sender: UIButton) {
        clearAll()
        employeeViewModel.getLocation()
    }
    
    func updateDataSource(){
        
        self.dataSource = WeatherTableViewDatasource(cellIdentifier: "Cell", items: self.employeeViewModel.empData.daily, configureCell: { (cell, weather) in
            
            let date = Date(timeIntervalSince1970: Double(weather.dt))
            let dayString = date.dayOfWeek()
            
            cell.dayLbl.text = dayString
            cell.tempLbl.text = "\(weather.temp.day)"
            cell.temp_maxLbl.text  = "\(weather.temp.max)"
            cell.temp_minLbl.text  = "\(weather.temp.min)"
            cell.humidityLbl.text  = "\(weather.humidity)"
            
            let weatherIconName = weather.weather[0].icon
            cell.iconImg.image = UIImage(named:weatherIconName)
        })
        
        DispatchQueue.main.async {
            self.weatherTableView.dataSource = self.dataSource
            self.weatherTableView.reloadData()
        }
    }
}
