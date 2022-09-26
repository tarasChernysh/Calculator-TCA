//
//  NumberFieldView.swift
//  Calulator-TCA
//
//  Created by tchernysh on 26.09.2022.
//

import SwiftUI

struct NumberFieldView: View {
    
    @Binding var value: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 100))
        }
    }
}

struct NumberFieldView_Previews: PreviewProvider {
    static var previews: some View {
        NumberFieldView(value: .constant("0"))
    }
}
