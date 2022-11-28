//
//  CalculatorView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import SwiftUI
import ComposableArchitecture

struct CalculatorView: View {
    
    let store: StoreOf<CalculatorDomain>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    NumberFieldView(value: viewStore.displayedText)
                        .padding()
                    
                    ForEach(viewStore.buttons, id: \.self) { rows in
                        HStack(spacing: 12) {
                            ForEach(rows) { item in
                                ButtonView(calculatorButtonType: item) { element in
                                    viewStore.send(.tapped(element))
                                }
                            }
                        }
                        .padding(.bottom, 3)
                    }
                }
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(store: Store(initialState: CalculatorDomain.State(), reducer: CalculatorDomain()))
    }
}
