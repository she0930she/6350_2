//
//  APICalls.swift
//  Weather365
//
//  Created by Amanda on 2022/4/3.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftSpinner
import PromiseKit

extension ViewController {
    func getLocationData(_ url : String) -> Promise<LocationModel>{

            return Promise<LocationModel> { seal -> Void in

                AF.request(url).responseJSON { response in
                    if response.error != nil {
                        seal.reject(response.error!)
                    }

                    let location = LocationModel()

                    // I will get data here
                    let tmp = JSON(response.data!)
                    location.key = tmp["Key"].stringValue
                    location.city = tmp["EnglishName"].stringValue
                    location.state = tmp["AdministrativeArea"]["ID"].stringValue
                    location.country = tmp["Country"]["ID"].stringValue
    
                    seal.fulfill(location) // I am fulfilling the promise

                }// end of response        }// end is return Promise

        }// end of function
    }
    
    func getCurrentWeatherData(_ url : String) -> Promise<CurrentWeatherModel>{

            return Promise<CurrentWeatherModel> { seal -> Void in

                AF.request(url).responseJSON { response in
                    if response.error != nil {
                        seal.reject(response.error!)
                    }

                    let currentWeather = CurrentWeatherModel()

                    // I will get data here
                    let curArray = JSON(response.data!).arrayValue
                    guard let curWeather = curArray.first else {return seal.fulfill(currentWeather)}
                    
                    currentWeather.WeatherText = curWeather["WeatherText"].stringValue
                    currentWeather.WeatherIcon = curWeather["WeatherIcon"].intValue
                    currentWeather.IsDayTime = curWeather["IsDayTime"].boolValue
                    currentWeather.Temperature = curWeather["Temperature"]["Imperial"]["Value"].intValue
    
                    seal.fulfill(currentWeather) // I am fulfilling the promise

                }// end of response        }// end is return Promise

        }// end of function
    }
}
