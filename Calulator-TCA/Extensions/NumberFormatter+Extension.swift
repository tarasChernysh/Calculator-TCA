//
//  NumberFormatter+Extension.swift
//  Calulator-TCA
//
//  Created by tchernysh on 27.11.2022.
//

import Foundation

extension NumberFormatter {
	static let calculatorFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.maximumFractionDigits = 2
		formatter.numberStyle = .decimal
		formatter.roundingMode = .halfUp
		return formatter
	}()
}
