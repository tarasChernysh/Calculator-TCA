//
//  CalculatorButtonType.swift
//  Calculator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import Foundation
import SwiftUI

enum CalculatorButtonType: String, Identifiable, Equatable {
	case one = "1"
	case two = "2"
	case three = "3"
	case four = "4"
	case five = "5"
	case six = "6"
	case seven = "7"
	case eight = "8"
	case nine = "9"
	case zero = "0"
	case equal = "="
	case substract = "-"
	case multiply = "*"
	case add = "+"
	case divide = "/"
	case clear = "C"
	case decimal = "."
	case percent = "%"
	case negative = "-/+"

	var id: String { rawValue }

	var backgroundColor: Color {
		switch self {
		case .add, .substract, .multiply, .divide, .equal:
			return .orange

		case .clear, .negative, .percent:
			return Color(UIColor.lightGray)

		default:
			return Color(UIColor.darkGray)
		}
	}
}
