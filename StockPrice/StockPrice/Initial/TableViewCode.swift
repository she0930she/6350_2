//
//  TableViewCode.swift
//  StockPrice
//
//  Created by Amanda on 2022/4/10.
//

import UIKit


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell

        cell.lblcompany.text = StockModel?[indexPath.row].name
        cell.cSymbol = StockModel?[indexPath.row].symbol
        //cell.lblImage.text = imageLabel[indexPath.row]
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = arr[indexPath.row]
//        return cell
    }
}

