//
//  ViewController.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/10.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {
    
    
    
    

    @IBOutlet weak var lblcompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    
    var stocks : [StockModel] = [StockModel]()
    
    var arr = ["FB","AAPL", "GOOG", "MSFT", "AMZN"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPPLStock()
    }
    
    func getAPPLStock(){

        let AMZN = StockModel("Amazon", "AMZN")
        let FB = StockModel("Facebook", "FB")
        let MSFT = StockModel("Microsoft", "MSFT")
        let GOOG = StockModel("Google", "GOOG")
        let AAPL = StockModel("APPLE", "AAPL")
        
        stocks.append(AMZN)
        stocks.append(FB)
        stocks.append(MSFT)
        stocks.append(GOOG)
        stocks.append(AAPL)
        
//        let url = getStockURL("AAPL")
//        print(url)
//        getStockData(url)
//            .done { stockModel in
//                self.lblcompanyName.text = stockModel.name
//                self.lblSymbol.text = stockModel.symbol
//
//            }
//            .catch { error in
//                print(error.localizedDescription)
//            }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
                
        let stockModel = stocks[indexPath.row]
        cell.lblSymbol.text = stockModel.symbol
        cell.lblName.text = stockModel.name
        cell.symbol = stockModel.symbol
        cell.cName = stockModel.name
        cell.sendStockDelegate = self
        
        return cell
    }
    func sendStockData(_ stockModel: StockModel) {
        lblcompanyName.text = "company: \(stockModel.name)"
        lblSymbol.text = "symbol: \(stockModel.symbol)"
        lblPrice.text = "price: \(stockModel.price)"
        lblDayHigh.text = "day high: \(stockModel.dayHigh)"
        lblDayLow.text = "day low: \(stockModel.dayLow)"
    }
        
        

}

                 
