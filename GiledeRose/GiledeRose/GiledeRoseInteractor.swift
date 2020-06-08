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
    private var timer: Timer?
    
    init() {
        let shop = ProductFactory.shared.object(for: ProductFactory.shopKey) as! GiledeRoseShopProtocol
        dataSource = shop.products
        executionList = dataSource
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}


extension GiledeRoseInteractor: GiledeRoseInteractorProtocol {
    func close() {
        timer?.invalidate()
        timer = nil
    }
    func open() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(handleProducts), userInfo: nil, repeats: true)
        timer?.fire()
    }
}


fileprivate extension GiledeRoseInteractor {
    
    @objc func handleProducts() {
        if daysHasPast < days {
            
            for item in executionList {
                item.sellIn -= 1
                if item is BackstagePassProduct {
                    handleBackstagePassProductProduct(item as! BackstagePassProduct)
                } else {
                    handleNormalProduct(item)
                }
            }
        } else {
            timer?.invalidate()
            timer = nil
        }
        displayDatas?(daysHasPast)
        daysHasPast += 1
    }
    
    func handleNormalProduct(_ product: Product) {
        let decreaseValue = product.sellIn >= 0 ? 1 : 2
        product.quality = (product.quality - decreaseValue) > 0 ? (product.quality - decreaseValue) : 0
    }
    
    func handleBackstagePassProductProduct(_ product: BackstagePassProduct) {
        if product.sellIn > 10 {
            product.quality += 1
            product.quality = product.quality > 50 ? 50 : product.quality
        } else if product.sellIn > 5 && product.sellIn <= 10 {
            product.quality += 2
            product.quality = product.quality > 50 ? 50 : product.quality
        } else if product.sellIn >= 0 && product.sellIn <= 5 {
            product.quality += 3
            product.quality = product.quality > 50 ? 50 : product.quality
        } else {
            product.quality = 0
        }
        
    }
}
