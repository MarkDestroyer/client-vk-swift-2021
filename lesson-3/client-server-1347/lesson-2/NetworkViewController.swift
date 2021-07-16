//
//  NetworkViewController.swift
//  client-server-1347
//
//  Created by Artur Igberdin on 08.07.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {

    //FriendsAPIService
    //PhotoAPIService
    //GroupsAPIService
    //SettingsAPIService
    
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getWeather(city: "Moscow") { json in
            
            print(json)
        }
        
        //GET - URLSession
        //firstRequest()
        
        //POST - URLSession
        //secondRequest()
        
        //GET - Alamofire
        //thirdRequest()
        
    }
    
    func thirdRequest() {
        
        var urlParameters: Parameters = [
            "q": "Moscow,DE",
            "appid": "b1b15e88fa797225412429c1c50c122a1"
        ]
        
        let path = "/data/2.5/forecast"
        
        let baseURL = "http://samples.openweathermap.org"
        
        
        
        AF.request("\(baseURL)\(path)", parameters: urlParameters).responseJSON { response in
                    
            print(response.request)
            print(response.response)
            
            print(response.value)
                    
        }

    }
    
    //Запрос с помощью URL
    func firstRequest() {
        
        let session = URLSession(configuration: .default)
        
        //guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        var components = URLComponents(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
        
        guard let url = components?.url else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print(json as Any)
        }
        
        task.resume()
    }
    
    func secondRequest() {
        
        let session = URLSession(configuration: .default)
        

        var components = URLComponents()
        components.scheme = "http"
        components.host = "jsonplaceholder.typicode.com"
        
        components.path = "/posts"

        let urlParameters: [String: String] = [
            "title": "foo",
            "body": "bar",
            "userId": "1"
        ]
        
        let bodyParameters: [String: String] = [
            "title": "foo",
            "body": "bar",
            "userId": "1"
        ]
        
        components.queryItems = urlParameters.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        guard let url = components.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        NetworkLogger.log(request: request)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            NetworkLogger.log(response: response as? HTTPURLResponse, data: data, error: error)
            
            guard let data = data else { return }

            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print(json as Any)
        }
        
        task.resume()
    }

}
