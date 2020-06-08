//
//  ProductFactory.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import Foundation

protocol ProductFactoryProtocol {
    func register(key: String, value: AnyObject)
    func object(for key: String) -> AnyObject?
}

class ProductFactory {
    
    static let shopKey = "shopKey"
    
    var store: [String: AnyObject] = [:]
    
    static let shared = ProductFactory()
    private init() {}
}

extension ProductFactory: ProductFactoryProtocol {
    func register(key: String, value: AnyObject) {
        store[key] = value
    }
    
    func object(for key: String) -> AnyObject? {
        return store[key] ?? nil
    }
}
