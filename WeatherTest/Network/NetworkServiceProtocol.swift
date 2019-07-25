//
//  NetworkServiceProtocol.swift
//  WeatherTest
//
//  Created by Andrey Petrovskiy on 7/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
protocol NetworkServiceProtocol {
    func sendRequest(with city: Cities.RawValue, handler: @escaping(Weather) -> ())
}
