//
//  WeatherModel.swift
//  MyStuff
//
//  Created by apple on 2/19/24.
//

import Foundation

struct WeatherModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    var temperatureCesius: Int {
        Int(temp - 273.15)
    }
}

struct Weather: Codable {
    let weatherDescription: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
    
    var myDescription: String {
        switch weatherDescription {
        case "clear sky": return "In West Vancouwer, Clear"
        case "few clouds": return "Few clouds"
        case "scattered clouds": return "Scattered clouds"
        case "broken clouds": return "Broken clouds"
        case "shower rain": return "Shower rain"
        case "rain": return "Rain"
        case "thunderstorm": return "Thunderstorm"
        case "snow": return "Snow"
        case "mist": return "Mist"
        case "overcast clouds": return "Overcast clouds"
        case "moderate rain": return "Moderate rain"
        case "light rain": return "Light rain"
            
        default: return "No data"
        }
    }
}

