//
//  CustomTableViewCell.swift
//  ExchangeRate
//
//  Created by Maksym on 5/23/18.
//  Copyright © 2018 Maksym. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var nbuSaleLabel: UILabel!
    @IBOutlet weak var nbuCurrencyLabel: UILabel!
    @IBOutlet weak var nbuCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
