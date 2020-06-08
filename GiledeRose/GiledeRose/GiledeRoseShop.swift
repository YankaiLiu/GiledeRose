//
//  GiledeRoseShop.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import UIKit

protocol GiledeRoseShopProtocol {
    var products: [Product] { get set }
}

class GiledeRoseShop: GiledeRoseShopProtocol {
    var products: [Product] = []
}
