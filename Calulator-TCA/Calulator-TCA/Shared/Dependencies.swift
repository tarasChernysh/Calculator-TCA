//
//  Dependencies.swift
//  Calulator-TCA
//
//  Created by Taras Chernysh on 24.01.2024.
//

import Foundation
import ComposableArchitecture

extension CalculatorService: DependencyKey {
    static var liveValue: CalculatorService {
        CalculatorService()
    }
}

extension NumberConverterService: DependencyKey {
    static var liveValue: NumberConverterService {
        NumberConverterService()
    }
}

// MARK: - Values

extension DependencyValues {
    var calculatorService: CalculatorService {
        get { self[CalculatorService.self] }
        set { self[CalculatorService.self] = newValue }
    }
    
    var convertorService: NumberConverterService {
        get { self[NumberConverterService.self] }
        set { self[NumberConverterService.self] = newValue }
    }
}
