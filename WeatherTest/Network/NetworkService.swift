//
//  NetworkService.swift
//  WeatherTest
//
//  Created by Andrey Petrovskiy on 7/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WeatherNetworkService: NetworkServiceProtocol{
    
    func sendRequest(with city: Cities.RawValue, handler: @escaping(Weather) -> ()){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error)
                return
            }
            if let data = data{
                do{
                     let jsom = try JSONSerialization.jsonObject(with: data, options: [])
                    
                       print(jsom)
                    let answer = try JSONDecoder().decode(Weather.self, from: data)
                   
                 
                    OperationQueue.main.addOperation {
                        handler(answer)
                    }
                    
                } catch let decodErr{
                    print(decodErr)
                }
            }
        }.resume()
    }
    
}
