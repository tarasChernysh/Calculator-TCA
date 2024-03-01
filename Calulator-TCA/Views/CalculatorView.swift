//
//  CalculatorView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import ComposableArchitecture
import SwiftUI

struct CalculatorDomain: Reducer {
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

	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case let .tapped(buttonType):
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
}

struct CalculatorView: View {
	let store: StoreOf<CalculatorDomain>

	var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			GeometryReader { proxy in
				ZStack {
					Color.black.edgesIgnoringSafeArea(.all)
					VStack {
						Spacer()
						NumberFieldView(value: viewStore.displayedText)
							.padding()

						ForEach(viewStore.buttons, id: \.self) { rows in
							HStack(spacing: 12) {
								ForEach(rows) { item in
									ButtonView(calculatorButtonType: item, screenSize: proxy.size) {
										viewStore.send(.tapped(item))
									}
								}
							}
							.padding(.bottom, 3)
						}
					}
				}
			}
		}
	}
}

struct CalculatorView_Previews: PreviewProvider {
	static var previews: some View {
		CalculatorView(store: StoreOf<CalculatorDomain>(initialState: CalculatorDomain.State(), reducer: { CalculatorDomain() }))
	}
}
