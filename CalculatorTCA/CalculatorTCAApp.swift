//
//  CalculatorTCAApp.swift
//  CalculatorTCA
//
//  Created by tchernysh on 05.03.2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct CalculatorTCAApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(
                store: StoreOf<CalculatorDomain>(initialState: CalculatorDomain.State()) {
                    CalculatorDomain()
                })
        }
    }
}
