//
//  CalculatorService.swift
//  Calulator-TCA
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

struct CalculatorService {
}

// MARK: - CalculatorUseCase

extension CalculatorService: CalculatorUseCase {

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
