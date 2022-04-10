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

class ViewController: UIViewController {

    @IBOutlet weak var lblcompany: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    
    var arr = ["FB","AAPL", "GOOG", "MSFT", "AMZN"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPPLStock()
    }
    
    func getAPPLStock(){
        let url = getStockURL("AAPL")
        print(url)
        getStockData(url)
            .done { stockModel in
                self.lblcompany.text = stockModel.name
                
            }
            .catch { error in
                print(error.localizedDescription)
            }
        
    }

}

                 
