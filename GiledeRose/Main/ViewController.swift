//
//  ViewController.swift
//  GiledeRose
//
//  Created by Yankai Liu on 2020/6/7.
//  Copyright © 2020 Yankai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEnterButton()
    }
    
    func setupEnterButton() {
        let enterButton = UIButton(type: .custom)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Enter into shop", for: .normal)
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.backgroundColor = .lightGray
        enterButton.addTarget(self, action: #selector(clickEnterButton), for: .touchUpInside)
        view.addSubview(enterButton)
        
        NSLayoutConstraint.activate([
            enterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc func clickEnterButton() {
        resetProducts()
        let interactor = GiledeRoseInteractor()
        let shopController = GiledeRoseViewController(interactor: interactor)
        navigationController?.pushViewController(shopController, animated: true)
    }
    
    func resetProducts() {
        let shop = GiledeRoseShop()
        let product = Product(sellIn: 10, quality: 50)
        let product1 = Product(sellIn: 5, quality: 35)
        let product2 = BackstagePassProduct(sellIn: 20, quality: 5)
        let product3 = BackstagePassProduct(sellIn: 12, quality: 10)
        shop.products = [product,product2,product1,product3]
        ProductFactory.shared.register(key: ProductFactory.shopKey, value: shop)
    }
}

