//
//  APIService.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 08.07.2021.
//

import Foundation

import Foundation
import Alamofire

class APIService {
    
    let baseUrl = "http://api.openweathermap.org"
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    func getWeather(city: String, completion: @escaping (Any)->()) {
        
   
        let path = "/data/2.5/forecast"
        
        let urlParameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]

        let url = baseUrl+path

        AF.request(url, method: .get, parameters: urlParameters).responseJSON { response in
            print(response.value)
            
            completion(response.value)
        }
        
    }
}

//// создаем экземпляр сервиса
//    let weatherService = WeatherService()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//// отправим запрос для получения погоды для Москвы
//        weatherService.loadWeatherData(city: "Moscow")
//
//    }

