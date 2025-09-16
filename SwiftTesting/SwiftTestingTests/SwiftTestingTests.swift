//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by ÖMER  on 16.09.2025.
//

import XCTest
@testable import SwiftTesting

final class SwiftTestingTests: XCTestCase {

    /*
    // Testleri çalıştırmadan önce bişey yapmak istersek
    override func setUpWithError() throws {
        
    }
    
    // Bittikten sonra bişey yapmak için
    override func tearDownWithError() throws {
        
    }
    */
    
    let math = MathFunctions()
    
    func testAddIntegersFunction(){
        let result = math.addIntregers(10, 20)
        
        // doğruysa süper yanlışsa çökert
        XCTAssertEqual(result, 30) // result ile 30 eşit mi kontrol et
    }
    
    func testMultiplyIntregers(){
        let result = math.multiplyIntregers(3, 4)
        
        XCTAssertEqual(result, 12)
    }
    
    
    func testMinusIntregers(){
        let result = math.minusIntregers(3, 4)
        
        XCTAssertEqual(result, -1)
    }
    
    func testDivideIntregers(){
        let result = math.divideIntregers(12, 6)
        
        XCTAssertEqual(result, 2)
    }
    
    
    
        

}
