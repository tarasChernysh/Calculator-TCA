//
//  CalculatorOperation.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import Foundation

enum CalculatorOperation {
    case add
    case divide
    case multiply
    case substract
    case unspecified

    init(buttonType: CalculatorButtonType) {
        switch buttonType {
        case .substract:
            self = .substract

        case .multiply:
            self = .multiply

        case .add:
            self = .add

        case .divide:
            self = .divide

        default:
            self = .unspecified
        }
    }
}
