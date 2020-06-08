//
//  GiledeRoseTests.swift
//  GiledeRoseTests
//
//  Created by Yankai Liu on 2020/6/8.
//  Copyright © 2020 ThoughtWorks. All rights reserved.
//

import XCTest
@testable import GiledeRose

import SwiftyMocky

class GiledeRoseTests: XCTestCase {
    var sut: GiledeRoseInteractorProtocol!
    override func setUp() {
         
    }
    
    func test_product_price_always_large_than_zero() {
        //Given
        let product = Product(sellIn: 1, quality: 1)
        let mockShop = GiledeRoseShopProtocolMock()
        Given(mockShop, .products(getter: [product]))
        ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
        sut = GiledeRoseInteractor()
        sut.days = 2
        
        //When
        sut.open()
        
        //Then
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            XCTAssert(product.quality == 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func test_product_price_always_less_than_fifty() {
        //Given
        let product = BackstagePassProduct(sellIn: 2, quality: 48)
        let mockShop = GiledeRoseShopProtocolMock()
        Given(mockShop, .products(getter: [product]))
        ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
        sut = GiledeRoseInteractor()
        sut.days = 1
        
        //When
        sut.open()
        
        //Then
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
            XCTAssert(product.quality == 50)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15)
    }
    
    func test_normal_product_decrease_speed_when_not_expired() {
        //Given
        let product = Product(sellIn: 1, quality: 20)
        let mockShop = GiledeRoseShopProtocolMock()
        Given(mockShop, .products(getter: [product]))
        ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
        sut = GiledeRoseInteractor()
        sut.days = 1
        
        //When
        sut.open()
        
        //Then
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            XCTAssert(product.quality == 19)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func test_normal_product_decrease_speed_when_expired() {
        //Given
        let product = Product(sellIn: 1, quality: 20)
        let mockShop = GiledeRoseShopProtocolMock()
        Given(mockShop, .products(getter: [product]))
        ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
        sut = GiledeRoseInteractor()
        sut.days = 2
        
        //When
        sut.open()
        
        //Then
        let expectation = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            XCTAssert(product.quality == 17)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func test_pass_product_increase_speed_when_in_five_to_ten_days() {
        //Given
         let product = BackstagePassProduct(sellIn: 7, quality: 30)
         let mockShop = GiledeRoseShopProtocolMock()
         Given(mockShop, .products(getter: [product]))
         ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
         sut = GiledeRoseInteractor()
         sut.days = 1
         
         //When
         sut.open()
         
         //Then
         let expectation = XCTestExpectation()
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
             XCTAssert(product.quality == 32)
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 10)
    }
    
    func test_pass_product_increase_speed_when_more_than_ten_days() {
        //Given
         let product = BackstagePassProduct(sellIn: 13, quality: 30)
         let mockShop = GiledeRoseShopProtocolMock()
         Given(mockShop, .products(getter: [product]))
         ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
         sut = GiledeRoseInteractor()
         sut.days = 1
         
         //When
         sut.open()
         
         //Then
         let expectation = XCTestExpectation()
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
             XCTAssert(product.quality == 31)
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 10)
    }
    
    func test_pass_product_increase_speed_when_in_zero_to_five_days() {
        //Given
         let product = BackstagePassProduct(sellIn: 4, quality: 30)
         let mockShop = GiledeRoseShopProtocolMock()
         Given(mockShop, .products(getter: [product]))
         ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
         sut = GiledeRoseInteractor()
         sut.days = 1
         
         //When
         sut.open()
         
         //Then
         let expectation = XCTestExpectation()
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
             XCTAssert(product.quality == 33)
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 10)
    }
    
    func test_passproduct_increase_speed_when_expired() {
        //Given
         let product = BackstagePassProduct(sellIn: 1, quality: 49)
         let mockShop = GiledeRoseShopProtocolMock()
         Given(mockShop, .products(getter: [product]))
         ProductFactory.shared.register(key: ProductFactory.shopKey, value: mockShop)
         sut = GiledeRoseInteractor()
         sut.days = 3
         
         //When
         sut.open()
         
         //Then
         let expectation = XCTestExpectation()
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
             XCTAssert(product.quality == 0)
             expectation.fulfill()
         }
         wait(for: [expectation], timeout: 10)
    }

}
