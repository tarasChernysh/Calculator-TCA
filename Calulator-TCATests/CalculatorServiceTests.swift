//
//  CalculatorServiceTests.swift
//  Calulator-TCATests
//
//  Created by tchernysh on 29.11.2022.
//

@testable import Calulator_TCA
import Foundation
import XCTest

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

	func testMultiplication() {
		// Given
		let number1: Double = 5
		let number2: Double = -5

		// When
		let expectedNubmer = service.multiply(operand1: number1, operand2: number2)

		// Then
		XCTAssertEqual(expectedNubmer, -25)
	}

	func testDivision() {
		// Given
		let number1: Double = 5
		let number2: Double = -5
		let number3: Double = 0

		// When
		let expectedNubmer1 = service.divideIfPossible(dividend: number1, divisor: number2)
		let expectedNubmer2 = service.divideIfPossible(dividend: number1, divisor: number3)

		// Then
		XCTAssertEqual(expectedNubmer1, -1)
		XCTAssertNil(expectedNubmer2)
	}

	func testSubstracing() {
		// Given
		let number1: Double = 5
		let number2: Double = -5

		// When
		let expectedNubmer = service.substract(minuend: number1, subtrahend: number2)

		// Then
		XCTAssertEqual(expectedNubmer, 10)
	}

	func testSumming() {
		// Given
		let number1: Double = 5
		let number2: Double = -5

		// When
		let expectedNubmer = service.sum(operand1: number1, operand2: number2)

		// Then
		XCTAssertEqual(expectedNubmer, 0)
	}
}
