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
    
    func testProductPriceAlwaysLargeThanZero() {
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
    
    func testProductPriceAlwaysLessThanFifty() {
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
    
    func testNormalProductDecreaseSpeedWhenNotExpired() {
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
    
    func testNormalProductDecreaseSpeedWhenExpired() {
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
    
    func testPassProductIncreaseSpeedWhenInFiveToTenDays() {
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
    
    func testPassProductIncreaseSpeedWhenMoreThanTenDays() {
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
    
    func testPassProductIncreaseSpeedWhenInZeroToFiveDays() {
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
    
    func testPassProductIncreaseSpeedWhenExpired() {
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
