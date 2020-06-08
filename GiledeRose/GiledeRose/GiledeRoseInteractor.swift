//
//  GiledeRoseInteractor.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol GiledeRoseInteractorProtocol {
    func open()
    var dataSource: [Product] { get set }
    var displayDatas: ((UInt) -> Void)? { get set }
    var days: UInt{ get set }
    func close()
}


class GiledeRoseInteractor {
    var dataSource: [Product]
    var executionList: [Product]
    var displayDatas: ((UInt) -> Void)?
    var days: UInt = UInt.max
    var daysHasPast: UInt = 0
    
    init() {
        let shop = ProductFactory.shared.object(for: ProductFactory.shopKey) as! GiledeRoseShopProtocol
        dataSource = shop.products
        executionList = dataSource
    }
}


extension GiledeRoseInteractor: GiledeRoseInteractorProtocol {
    func open() {
        
    }
    
    func close() {
        
    }
    
    
}
