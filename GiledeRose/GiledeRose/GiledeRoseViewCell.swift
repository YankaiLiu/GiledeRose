//
//  GiledeRoseViewCell.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 Yankai. All rights reserved.
//

import UIKit

class GiledeRoseViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLaebl: UILabel!
    
    @IBOutlet weak var sellInLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func update(_ product: Product) {
        let name = product is BackstagePassProduct ? "BackstagePass" : "Normal"
        textLabel?.text = "\(name)  \(product.sellIn)  \(product.quality)"
    }
    
}
