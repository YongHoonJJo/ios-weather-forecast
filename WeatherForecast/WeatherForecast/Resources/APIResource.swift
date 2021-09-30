//
//  APIResource.swift
//  WeatherForecast
//
//  Created by YongHoon JJo on 2021/09/30.
//

import Foundation

enum Method {
    case get
}

struct APIResource {
    let method: Method
    let url: String
    
    func generateRequest() -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        
        switch method {
        case .get:
            return URLRequest(url: url)
        }
    }
}