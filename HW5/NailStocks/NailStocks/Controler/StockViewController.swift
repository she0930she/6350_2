//
//  StockViewController.swift
//  NailStocks
//
//  Created by Amanda on 2022/2/20.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        //guard let symbol = txtStockSymbol.text!.uppercased() else {return}
        let symbol = txtStockSymbol.text!.uppercased()
        
//        let url = "\(shortQuoteURL)\(symbol)?apikey=\(apiKey)"
//        print(url)
        
        let newUrl = "\(quoteURL)\(symbol)?apikey=\(apiKey)"
        print(newUrl)
        
        SwiftSpinner.show("Getting Stock Value for \(symbol)")
    
//        AF.request(url).responseJSON{ response in
//            SwiftSpinner.hide(nil)
//            if response.error != nil{
//                print(response.error!)
//                return
//            }
//            let stocks = JSON(response.data!).array
//            print(response.data)
//            guard let stock = stocks!.first else{return;}
//            print(stock)
//
//            let quote = QuoteShort()
//            quote.symbol = stock["symbol"].stringValue
//            quote.price = stock["price"].floatValue
//            quote.volume = stock["volume"].intValue
//
//            //self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
//        }
        
        AF.request(newUrl).responseJSON{ response in
            SwiftSpinner.hide(nil)
            if response.error != nil{
                print(response.error!)
                return
            }
            let company = JSON(response.data!).array
            print(response.data)
            guard let company = company!.first else{return;}
            print(company)
            
            let companyQuote = Quote()
            companyQuote.symbol = company["symbol"].stringValue
            companyQuote.price = company["price"].floatValue
            companyQuote.name = company["name"].stringValue
            companyQuote.changesPercentage = company["changesPercentage"].floatValue
            

            self.lblStockPrice.text = "name: \(companyQuote.name)" + "changesPercentage: \(companyQuote.changesPercentage)"
        
        }
        
        
        
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
