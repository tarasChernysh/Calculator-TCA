//
//  RootDomain.swift
//  Calulator-TCA
//
//  Created by tchernysh on 27.11.2022.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct RootDomain: ReducerProtocol {
    
    struct State: Equatable {
        var calculatorDomainState: CalculatorDomain.State?
    }

    enum Action: Equatable {
        case main(CalculatorDomain.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            return .none
        }
        .ifLet(\.calculatorDomainState, action: /Action.main) {
            CalculatorDomain()
        }
    }
}
