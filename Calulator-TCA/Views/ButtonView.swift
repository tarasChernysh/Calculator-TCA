//
//  ButtonView.swift
//  Calculator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import SwiftUI

struct ButtonView: View {
	let calculatorButtonType: CalculatorButtonType
	let screenSize: CGSize
	let action: () -> Void

	var body: some View {
		Button {
			self.action()
		} label: {
			Text(calculatorButtonType.rawValue)
				.font(.system(size: 32))
				.frame(
					width: self.getButtonWidth(),
					height: self.getButtonHeight()
				)
				.background(calculatorButtonType.backgroundColor)
				.foregroundColor(Color.white)
				.cornerRadius(self.getButtonHeight() / 2)
		}
	}

	private func getButtonWidth() -> CGFloat {
		if calculatorButtonType == .zero {
			return (screenSize.width - 5.0 * 12.0) / 4 * 2
		}
		return (screenSize.width - 5.0 * 12.0) / 4
	}

	private func getButtonHeight() -> CGFloat {
		(screenSize.width - 5.0 * 12.0) / 4
	}
}

struct ButtonView_Previews: PreviewProvider {
	static var previews: some View {
		ButtonView(calculatorButtonType: .five, screenSize: CGSize(width: 330, height: 700), action: {})
	}
}
