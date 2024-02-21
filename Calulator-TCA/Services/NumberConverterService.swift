//
//  NumberConverterService.swift
//  Calulator-TCA
//
//  Created by tchernysh on 27.11.2022.
//

import Foundation

struct NumberConverterService {

    func convertIfNeeded(curentValue: String, withNew value: String) -> String {

        var valueToDisplay = ""
        let number = convertToNumberOrZero(currentValue: curentValue)
        let innitialValue = convertToInitialValue()
        let decimalButtonType = CalculatorButtonType.decimal
        if curentValue == innitialValue, value != decimalButtonType.rawValue {
            valueToDisplay = value
        } else if number.isInteger, value == decimalButtonType.rawValue {
            if curentValue.isEmpty {
                valueToDisplay = "\(innitialValue)\(value)"
            } else {
                valueToDisplay = "\(curentValue)\(value)"
            }
        } else if value == decimalButtonType.rawValue {
            valueToDisplay = curentValue
        } else {
            valueToDisplay = "\(curentValue)\(value)"
        }

        return valueToDisplay
    }

    func convertToInitialValue() -> String { convertToDisplayableValue(currentValue: "0") }

    func convertToNumberOrZero(currentValue: String) -> Double {
        NumberFormatter.calculatorFormatter.number(from: currentValue)?.doubleValue ?? 0
    }

    func convertToDisplayableValue(currentValue: String) -> String {
        let number = convertToNumberOrZero(currentValue: currentValue)
        return NumberFormatter.calculatorFormatter.string(from: .init(value: number)) ?? convertToInitialValue()
    }

    func convertToDisplayableValue(currentNumber: Double) -> String {
        NumberFormatter.calculatorFormatter.string(from: .init(value: currentNumber)) ?? convertToInitialValue()
    }
}
