//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/10.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    var symbol = ""
    var cName = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getPriceAction(_ sender: Any) {
        let url = getStockURL(symbol)
        getStockData(url)
            .done{stockModel in
                self.sendStockDelegate?.sendStockData(StockModel)
            }.catch { error in
                print(error.localizedDescription)
            }
        
//        getCurrentWeather(currentURL).done { currentWeatherModel in
//            currentWeatherModel.city = self.city
//            self.sendWeatherDelegate?.sendWeatherData(currentWeatherModel)
//
//        }
//        .catch { error in
//            print(error.localizedDescription)
//        }
    }
     
}
