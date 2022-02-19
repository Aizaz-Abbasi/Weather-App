//
//  Global Var.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import Foundation


let URL_SAMPLE = "https://api.openweathermap.org/data/2.5/onecall?lat=60.99&lon=30.9&appid=926247ac53ed30b659cab42495a479fd"

let URL_API_KEY = "926247ac53ed30b659cab42495a479fd"
var URL_LATITUDE = "60.99"
var URL_LONGITUDE = "30.0"
var URL_GET_ONE_CALL = ""
let URL_BASE = "https://api.openweathermap.org/data/2.5"


func buildURL() -> String {
    URL_GET_ONE_CALL = "/onecall?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&units=imperial" + "&appid=" + URL_API_KEY
    return URL_BASE + URL_GET_ONE_CALL
}

func setLatitude(_ latitude: String) {
    URL_LATITUDE = latitude
}

func setLatitude(_ latitude: Double) {
    setLatitude(String(latitude))
}

func setLongitude(_ longitude: String) {
    URL_LONGITUDE = longitude
}

func setLongitude(_ longitude: Double) {
    setLongitude(String(longitude))
}
