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
                    
//                    if let data = response.data, let utf8Text = String(data:data, encoding:.utf8){
//                        let weatherData = JSON.init(parseJSON: utf8Text)
//
//                        location.key = weatherData["Key"].stringValue
//                        location.city = weatherData["EnglishName"].stringValue
//                        location.state = weatherData["AdministrativeView"]["ID"].stringValue
//                        location.country = weatherData["Country"]["ID"].stringValue
//
//                        print(weatherData)
//                    }
                    
                    
                    
                    seal.fulfill(location) // I am fulfilling the promise

                }// end of response        }// end is return Promise

        }// end of function
    }
}
