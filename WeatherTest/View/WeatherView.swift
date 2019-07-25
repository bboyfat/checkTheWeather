//
//  WeatherView.swift
//  WeatherTest
//
//  Created by Andrey Petrovskiy on 7/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempValueLbl: UILabel!
    @IBOutlet weak var atmPresureLbl: UILabel!
    @IBOutlet weak var humidityValueLbl: UILabel!
    @IBOutlet weak var windSpeedValueLbl: UILabel!
    @IBOutlet weak var windDirectionValueLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
