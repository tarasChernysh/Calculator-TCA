//
//  RootView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 28.11.2022.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct RootDomain {
    
    struct State: Equatable {
        var calculatorDomainState: CalculatorDomain.State?
    }

    enum Action: Equatable {
        case main(CalculatorDomain.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
        .ifLet(\.calculatorDomainState, action: /Action.main) {
            CalculatorDomain()
        }
    }
}

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
