//
//  NetworkingCalls.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/10.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftSpinner
import PromiseKit

extension ViewController {
    
    func getStockURL(_ symbol : String) -> String {
        let url = "\(quoteURL)\(symbol)?apikey=\(myKey)"
        return url
        
    }
    func getStockData(_ url : String) -> Promise<StockModel>{

            return Promise<StockModel> { seal -> Void in

                AF.request(url).responseJSON { response in
                    if response.error != nil {
                        seal.reject(response.error!)
                    }

//                    let company = JSON(response.data!).array
////                    print(response.data)
//                    guard let companyJSON = company!.first else{return;}
////                    print(company)
                    let StockContent = StockModel()
                    
                    let stocks = JSON(response.data!).arrayValue
                    
                    guard let companyJSON = stocks.first else { return seal.fulfill(StockContent)}
                    
                    
                    
                    
//                    let company = JSON(response.data!).arrayValue
//                    guard let companyJSON = company.first else {return seal.fulfill(StockContent)}
//                    print(companyJSON)
                    StockContent.name = companyJSON["name"].stringValue
                    StockContent.symbol = companyJSON["symbol"].stringValue
                    StockContent.price = companyJSON["price"].floatValue
                    StockContent.dayHigh = companyJSON["dayHigh"].floatValue
                    StockContent.dayLow = companyJSON["dayLow"].floatValue
                    print(StockContent.name)
                    
    
                    seal.fulfill(StockContent) // I am fulfilling the promise
                }// end of response        }// end is return Promise
        }// end of function
    }
    
}
