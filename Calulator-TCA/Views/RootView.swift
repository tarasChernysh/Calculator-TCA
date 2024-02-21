//
//  RootView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 28.11.2022.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct RootDomain {
	struct State: Equatable {
		var calculatorDomainState: CalculatorDomain.State?
	}

	enum Action: Equatable {
		case main(CalculatorDomain.Action)
	}

	var body: some ReducerOf<Self> {
		Reduce { _, _ in
			.none
		}
		.ifLet(\.calculatorDomainState, action: /Action.main) {
			CalculatorDomain()
		}
	}
}

struct RootView: View {
	let store: StoreOf<RootDomain>

	var body: some View {
		WithViewStore(store, observe: { $0 }) { _ in
			CalculatorView(store: store.scope(state: { state in
				state.calculatorDomainState ?? CalculatorDomain.State()
			}, action: { childAction in
				RootDomain.Action.main(childAction)
			}))
		}
	}
}
