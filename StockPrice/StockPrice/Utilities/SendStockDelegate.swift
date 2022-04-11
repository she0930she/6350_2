//
//  SendStockDelegate.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/11.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockModel)
}
