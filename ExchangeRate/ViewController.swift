//
//  ViewController.swift
//  ExchangeRate
//
//  Created by Maksym on 5/23/18.
//  Copyright © 2018 Maksym. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var privatTableView: UITableView!
    @IBOutlet weak var nbuTableView: UITableView!
    
    var api = PrivatApi()
    var select = FindingRows()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Курсы валют"

        api.getPrivatRate()
        {
            completion in
            if completion != nil {
//                print(completion!)
                self.privatTableView.delegate = self
                self.privatTableView.dataSource = self
                self.privatTableView.reloadData()
            } else {
                return
            }
        }
        
        api.getNbuRate()
            {
                completion in
                if completion != nil {
//                    print(completion!)
                    self.nbuTableView.delegate = self
                    self.nbuTableView.dataSource = self
                    self.nbuTableView.reloadData()
                } else {
                    return
            }
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count : Int?
        
        if tableView == self.privatTableView {
            count = ArrayOfDic.count
        }
        
        if tableView == self.nbuTableView {
            count = ArrayofDic2.count
        }
        return count!
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: CustomTableViewCell?
        
        if tableView == self.privatTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell
            
            cell!.currencyLabel.text = ArrayOfDic[indexPath.row]["ccy"] as? String
            
            var temp: String = ArrayOfDic[indexPath.row]["buy"] as! String
            var indexOfDot = temp.index(of: ".")
            var index = temp.index(indexOfDot!, offsetBy: 4)
            cell!.saleLabel.text = String(temp.prefix(upTo: index))
            
            temp = ArrayOfDic[indexPath.row]["sale"] as! String
            indexOfDot = temp.index(of: ".")
            index = temp.index(indexOfDot!, offsetBy: 4)
            cell!.purchaseLabel.text = String(temp.prefix(upTo: index))
        }
        
        if tableView == self.nbuTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "nbuCell") as? CustomTableViewCell
            
            cell!.nbuCurrencyLabel.text = ArrayofDic2[indexPath.row]["txt"] as? String
 
            let temp: String = String(format: "%@", ArrayofDic2[indexPath.row]["rate"] as! CVarArg)
            let indexOfDot = temp.index(of: ".")
            let index = temp.index(indexOfDot!, offsetBy: 4)
            cell!.nbuSaleLabel.text = String(temp.prefix(upTo: index))
            
            if indexPath.row % 2 == 0 {
                cell!.backgroundColor = UIColor.white
            } else {
                cell!.backgroundColor = UIColor(hexString: "#fafafa")
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.privatTableView {
            if let newRow = select.privatRow(index: indexPath.row) {
                nbuTableView.selectRow(at: [0, newRow], animated: true, scrollPosition: UITableViewScrollPosition.middle)
            }
        }
        
        if tableView == self.nbuTableView {
            if let newRow = select.nbuRow(index: indexPath.row) {
                privatTableView.selectRow(at: [0, newRow], animated: true, scrollPosition: UITableViewScrollPosition.middle)
            }
        }
    }
}

