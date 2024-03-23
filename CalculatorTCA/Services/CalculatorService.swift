//
//  CalculatorService.swift
//  Calculator-TCA
//
//  Created by tchernysh on 27.11.2022.
//

import Foundation

protocol CalculatorUseCase: Sendable {
	func makeNegative(from number: Double) -> Double
	func getPercent(from number: Double) -> Double
	func sum(operand1: Double, operand2: Double) -> Double
	func multiply(operand1: Double, operand2: Double) -> Double
	func substract(minuend: Double, subtrahend: Double) -> Double
	func divideIfPossible(dividend: Double, divisor: Double) -> Double?
}

/// A service that execute all math logic
/// in app
///
/// There are following operations:
/// - addition: use ``sum(operand1:operand2:)``
/// - substraction: use ``substract(minuend:subtrahend:)``
/// - division: use ``divideIfPossible(dividend:divisor:)``
/// - multiplication: use ``multiply(operand1:operand2:)``
/// - making negative: use ``makeNegative(from:)``
/// - getting percent: use ``getPercent(from:)``
///
struct CalculatorService: CalculatorUseCase {
    
    /// Make input number with opposite sign
    ///
    /// ```swift
    /// let number: Double = 1
    /// let resultNumber = self.makeNegative(from: number)
    ///
    /// print(resultNumber) // "-1"
    ///
    /// ```
    func makeNegative(from number: Double) -> Double {
        -number
    }
    
    func getPercent(from number: Double) -> Double {
        number / 100
    }

    func sum(operand1: Double, operand2: Double) -> Double {
        operand1 + operand2
    }

    func divideIfPossible(dividend: Double, divisor: Double) -> Double? {
        guard divisor.isZero == false else {
            return nil
        }
        return dividend / divisor
    }

    func multiply(operand1: Double, operand2: Double) -> Double {
        operand1 * operand2
    }

    func substract(minuend: Double, subtrahend: Double) -> Double {
        minuend - subtrahend
    }
}
