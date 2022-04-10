//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/10.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
    var cityKey = ""
    var cSymbol = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getPriceAction(_ sender: Any) {
        
    }
    
    
    
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    
    
    
}
