//
//  DateFormat.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import Foundation
//https://api.openweathermap.org/data/2.5/onecall?lat=33.5651&lon=73.0169&units=imperial&appid=926247ac53ed30b659cab42495a479fd


//class APIService :  NSObject {
//
//    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
//
//    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
//
//        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
//            if let data = data {
//
//                let jsonDecoder = JSONDecoder()
//
//                let empData = try! jsonDecoder.decode(Employees.self, from: data)
//
//                    completion(empData)
//            }
//
//        }.resume()
//    }
//
//}

class NetworkService :  NSObject{
    
    let session = URLSession(configuration: .default)
    
    func getWeather(onSuccess: @escaping (Result) -> Void, onError: @escaping (String) -> Void) {
        guard let url = URL(string: buildURL()) else {
            onError("Error building URL")
            return
        }
        print(buildURL())
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let items = try JSONDecoder().decode(Result.self, from: data)
                        onSuccess(items)
                    } else {
                        onError("Response wasn't 200. It was: " + "\n\(response.statusCode)")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
    
}






























//class APIService :  NSObject {
//
//    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
//
//    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
//
//        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
//            if let data = data {
//
//                let jsonDecoder = JSONDecoder()
//
//                let empData = try! jsonDecoder.decode(Employees.self, from: data)
//
//                    completion(empData)
//            }
//
//        }.resume()
//    }
//
//}
//
//class NetworkService {
//    static let shared = NetworkService()
//
//    let URL_API_KEY = "926247ac53ed30b659cab42495a479fd"
//    var URL_LATITUDE = "60.99"
//    var URL_LONGITUDE = "30.0"
//    var URL_GET_ONE_CALL = ""
//    let URL_BASE = "https://api.openweathermap.org/data/2.5"
//
//    let session = URLSession(configuration: .default)
//
//    func buildURL() -> String {
//        URL_GET_ONE_CALL = "/onecall?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&units=imperial" + "&appid=" + URL_API_KEY
//        return URL_BASE + URL_GET_ONE_CALL
//    }
//
//    func setLatitude(_ latitude: String) {
//        URL_LATITUDE = latitude
//    }
//
//    func setLatitude(_ latitude: Double) {
//        setLatitude(String(latitude))
//    }
//
//    func setLongitude(_ longitude: String) {
//        URL_LONGITUDE = longitude
//    }
//
//    func setLongitude(_ longitude: Double) {
//        setLongitude(String(longitude))
//    }
//
//    func getWeather(onSuccess: @escaping (Result) -> Void, onError: @escaping (String) -> Void) {
//        guard let url = URL(string: buildURL()) else {
//            onError("Error building URL")
//            return
//        }
//
//        let task = session.dataTask(with: url) { (data, response, error) in
//
//            DispatchQueue.main.async {
//                if let error = error {
//                    onError(error.localizedDescription)
//                    return
//                }
//
//                guard let data = data, let response = response as? HTTPURLResponse else {
//                    onError("Invalid data or response")
//                    return
//                }
//
//                do {
//                    if response.statusCode == 200 {
//                        let items = try JSONDecoder().decode(Result.self, from: data)
//                        onSuccess(items)
//                    } else {
//                        onError("Response wasn't 200. It was: " + "\n\(response.statusCode)")
//                    }
//                } catch {
//                    onError(error.localizedDescription)
//                }
//            }
//
//        }
//        task.resume()
//    }
//
//}
