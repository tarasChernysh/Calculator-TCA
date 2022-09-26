//
//  CalculatorView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var runningNumber: Double = 0
    @State var value = ""
    @State var operation: CalculatorOperation = .unspecified
    
    let buttons: [[CalculatorButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                NumberFieldView(value: $value)
                    .padding()
                
                ForEach(buttons, id: \.self) { rows in
                    HStack(spacing: 12) {
                        ForEach(rows) { item in
                            ButtonView(calculatorButtonType: item) { element in
                                self.buttonTapped(button: element)
                            }
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    // MARK: - Private
    
    private func buttonTapped(button: CalculatorButtonType) {
        switch button {
        case .divide, .decimal, .add, .multiply, .substract:
            self.operation = CalculatorOperation(buttonType: button)
            runningNumber = Double(value) ?? 0
            
            if button != .equal {
                value = "0"
            }
            
        case .negative:
            let number = Double(value) ?? 0
            if number.isZero == false {
                value = "\(-number)"
            }
            
        case .percent:
            let number = Double(value) ?? 0
            if number.isZero == false {
                value = "\(number / 100)"
            }
            
        case .equal:
            let currentValue = Double(value) ?? 0
            switch operation {
            case .add:
                value = "\(currentValue + runningNumber)"
            case .divide:
                if currentValue.isZero == false {
                    value = "\(runningNumber / currentValue)"
                }
            case .multiply:
                value = "\(currentValue * runningNumber)"
            case .substract:
                value = "\(runningNumber - currentValue)"
            case .unspecified:
                break
            }
            
        case .clear:
            value = "0"
            
        default:
            let number = button.rawValue
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
