//
//  Float+Extension.swift
//  Calculator-TCA
//
//  Created by tchernysh on 28.11.2022.
//

import Foundation

extension FloatingPoint {
	var isInteger: Bool {
		truncatingRemainder(dividingBy: 1) == 0
	}
}
