//
//  Calulator_TCAApp.swift
//  Calulator-TCA
//
//  Created by tchernysh on 22.08.2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct Calulator_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootDomain.State(
                        calculatorDomainState: CalculatorDomain.State()
                    ),
                    reducer: RootDomain()
                )
            )
        }
    }
}
