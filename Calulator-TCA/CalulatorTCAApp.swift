//
//  CalulatorTCAApp.swift
//  Calulator-TCA
//
//  Created by tchernysh on 22.08.2022.
//

import ComposableArchitecture
import SwiftUI

@main
struct CalulatorTCAApp: App {
	var body: some Scene {
		WindowGroup {
			CalculatorView(
				store: StoreOf<CalculatorDomain>(initialState: CalculatorDomain.State()) {
					CalculatorDomain()
				})
		}
	}
}
