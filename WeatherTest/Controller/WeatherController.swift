//
//  ViewController.swift
//  WeatherTest
//
//  Created by Andrey Petrovskiy on 7/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {
    //MARK: Properties
    @IBOutlet var weatherView: WeatherView!
    var networkService: NetworkServiceProtocol!
    
    var model: Weather!{
        didSet{
            if self.model != nil{
                setLabels()
            }
        }
    }
    
    var city: Cities = .kyiv{
        didSet{
            self.getTheWeather(for: self.city.rawValue)
        }
    }
    
    
    
    
    //MARK: Lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService = WeatherNetworkService()
        getTheWeather(for: city.rawValue)
    }
    
    //MARK: Methods
    
    private func getTheWeather(for city: Cities.RawValue){
        networkService.sendRequest(with: city) { (data) in
            self.model = data
        }
    }
    
    private func setLabels(){
        weatherView.cityNameLbl.text = model.name
        weatherView.humidityValueLbl.text = String(Int(model.main.humidity)) + "%"
        weatherView.atmPresureLbl.text = String(Int(model.main.pressure)) + " " + "hPa"
        let tempDouble = model.main.temp - 273.15
        weatherView.tempValueLbl.text = String(format: "%.2f", tempDouble) + " " + "ºC"
        weatherView.windSpeedValueLbl.text = String(Int(model.wind.speed)) + " " + "meter/sec"
        weatherView.windDirectionValueLbl.text = String(Int(model.wind.deg ?? 000)) + "º"
    }
    
    @IBAction func switchCity(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.city = .kyiv
        case 1:
            self.city = .paris
        case 2:
            self.city = .london
        default:
            self.city = .kyiv
        }
    }
    
}

