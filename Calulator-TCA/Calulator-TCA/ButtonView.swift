//
//  ButtonView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import SwiftUI

struct ButtonView: View {
    
    private let action: (CalculatorButtonType) -> Void
    private let calculatorButtonType: CalculatorButtonType
    
    init(calculatorButtonType: CalculatorButtonType, action: @escaping (CalculatorButtonType) -> Void) {
        self.calculatorButtonType = calculatorButtonType
        self.action = action
    }
    
    var body: some View {
        Button {
            self.action(calculatorButtonType)
        } label: {
            Text(calculatorButtonType.rawValue)
                .font(.system(size: 32))
                .frame(width: self.getButtonWidth(for: calculatorButtonType), height: self.getButtonHeight())
                .background(calculatorButtonType.backgroundColor)
                .foregroundColor(Color.white)
                .cornerRadius(self.getButtonHeight() / 2)
        }
    }
    
    private func getButtonWidth(for button: CalculatorButtonType) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 5.0 * 12.0) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5.0 * 12.0) / 4
    }
    
    private func getButtonHeight() -> CGFloat {
        (UIScreen.main.bounds.width - 5.0 * 12.0) / 4
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(calculatorButtonType: .five, action: { _ in })
    }
}
