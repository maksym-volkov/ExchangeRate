//
//  NbuTableViewCell.swift
//  ExchangeRate
//
//  Created by Maksym on 5/23/18.
//  Copyright © 2018 Maksym. All rights reserved.
//

import UIKit

class NbuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var NbuCellView: UIView!
    @IBOutlet weak var nbuCurrencyLabel: UILabel!
    @IBOutlet weak var nbuPurchaseLabel: UILabel!
    @IBOutlet weak var nbuSaleLabel: UILabel!
}
