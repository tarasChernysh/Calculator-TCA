//
//  CalculatorDomain.swift
//  Calulator-TCA
//
//  Created by tchernysh on 27.11.2022.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct CalculatorDomain: ReducerProtocol {
    
    struct State: Equatable {
        var runningNumber: Double = 0
        var displayedText = "0"
        var operation: CalculatorOperation = .unspecified
        
        let buttons: [[CalculatorButtonType]] = [
            [.clear, .negative, .percent, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .substract],
            [.one, .two, .three, .add],
            [.zero, .decimal, .equal]
        ]
    }
    
    enum Action: Equatable {
        case tapped(CalculatorButtonType)
    }
    
    @Dependency(\.calculatorService) private var calculatorUseCase
    @Dependency(\.convertorService) private var converterService
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapped(let buttonType):
            
            switch buttonType {
            case .divide, .add, .multiply, .substract:
                state.operation = CalculatorOperation(buttonType: buttonType)
                state.runningNumber = converterService.convertToNumberOrZero(currentValue: state.displayedText)
                if buttonType != .equal {
                    state.displayedText = converterService.convertToInitialValue()
                }
                
                return .none
                
            case .negative:
                let number = converterService.convertToNumberOrZero(currentValue: state.displayedText)
                let negativeNumber = calculatorUseCase.makeNegative(from: number)
                state.displayedText = converterService.convertToDisplayableValue(currentNumber: negativeNumber)
                return .none
                
            case .percent:
                let number = converterService.convertToNumberOrZero(currentValue: state.displayedText)
                let persentNumber = calculatorUseCase.getPercent(from: number)
                state.displayedText = converterService.convertToDisplayableValue(currentNumber: persentNumber)
                return .none
                
            case .equal:
                let number = converterService.convertToNumberOrZero(currentValue: state.displayedText)
                var newNumber: Double?
                switch state.operation {
                case .add:
                    newNumber = calculatorUseCase.sum(operand1: number, operand2: state.runningNumber)
                    
                case .divide:
                    newNumber = calculatorUseCase.divideIfPossible(dividend: state.runningNumber, divisor: number)
                
                case .multiply:
                    newNumber = calculatorUseCase.multiply(operand1: number, operand2: state.runningNumber)
                    
                case .substract:
                    newNumber = calculatorUseCase.substract(minuend: state.runningNumber, subtrahend: number)
                    
                case .unspecified:
                    break
                }
                
                guard let newNumber = newNumber else {
                    return .none
                }
                state.displayedText = converterService.convertToDisplayableValue(currentNumber: newNumber)
                
                return .none
                
            case .clear:
                state.displayedText = converterService.convertToInitialValue()
                return .none
                
            default:
                let value = converterService.convertIfNeeded(curentValue: state.displayedText, withNew: buttonType.rawValue)
                state.displayedText = value
                return .none
            }
        }
    }
}
