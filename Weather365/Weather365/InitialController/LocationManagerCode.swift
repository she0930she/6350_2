//
//  LocationManagerCode.swift
//  Weather365
//
//  Created by Amanda on 2022/4/10.
//

import Foundation
import CoreLocation

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error in getting location \(error.localizedDescription)")
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            guard let location = locations.last else { return }

            

            let lat = location.coordinate.latitude
            let lng = location.coordinate.longitude
    
            print(lat)
            print(lng)
            
            let url = locationAPIURL
            getLocationData(url)
                .done { location in
                    print(location.key)
                    print(location.city)
                    print(location.state)
                    print(location.country)
                    
                    
                    
                    self.getCurrentWeatherData(currentConditionsURL).done{CurrentWeatherModel in
                        print(CurrentWeatherModel.WeatherText)
                        print(CurrentWeatherModel.WeatherIcon)
                        print(CurrentWeatherModel.IsDayTime)
                        print(CurrentWeatherModel.Temperature)
                    }
                    .catch{error in
                        print(error.localizedDescription)
                    }
                }

                .catch { error in
                    print(error.localizedDescription)
                }
        }
}
