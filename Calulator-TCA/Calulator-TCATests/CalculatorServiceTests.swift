//
//  CalculatorServiceTests.swift
//  Calulator-TCATests
//
//  Created by tchernysh on 29.11.2022.
//

import Foundation
import XCTest
@testable import Calulator_TCA

final class CalculatorServiceTests: XCTestCase {
    
    private var service: CalculatorUseCase!

    // MARK: - Setup
    
    override func setUpWithError() throws {
       
        service = CalculatorService()
    }

    override func tearDownWithError() throws {
        service = nil
    }
    
    // MARK: - Testing
    
    func testMakingNegativeNumber() throws {
        // Given
        let number1: Double = 5
        let number2: Double = -5
        let number3: Double = 0
        
        // When
        let negativeNumber1 = service.makeNegative(from: number1)
        let negativeNumber2 = service.makeNegative(from: number2)
        let negativeNumber3 = service.makeNegative(from: number3)
        
        // Then
        XCTAssertTrue(negativeNumber1 == -number1)
        XCTAssertTrue(negativeNumber2 == -number2)
        XCTAssertTrue(negativeNumber3 == number3)
    }
    
    func testGettingPersentNumber() throws {
        // Given
        let number1: Double = 5
        let number2: Double = -5
        let number3: Double = 0
        
        // When
        let expectedNumber1 = service.getPercent(from: number1)
        let expectedNumber2 = service.getPercent(from: number2)
        let expectedNumber3 = service.getPercent(from: number3)
        
        // Then
        XCTAssertTrue(expectedNumber1 == 0.05)
        XCTAssertTrue(expectedNumber2 == -0.05)
        XCTAssertTrue(expectedNumber3 == 0)
    }
}
