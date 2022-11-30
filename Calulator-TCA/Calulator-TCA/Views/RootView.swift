//
//  RootView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 28.11.2022.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    
    let store: StoreOf<RootDomain>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            CalculatorView(store: store.scope(state: { state in
                state.calculatorDomainState ?? CalculatorDomain.State()
            }, action: { childAction in
                RootDomain.Action.main(childAction)
            }))
        }
    }
}
