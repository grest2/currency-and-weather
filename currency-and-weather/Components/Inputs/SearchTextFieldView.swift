//
//  SearchView.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/25/21.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    var placeholder: String = ""
    @State var onFocus: Bool = false
    @Binding var text: String
    
    var body: some View {
        
        VStack(alignment: .center,spacing: 5) {
            ZStack {
                if text.isEmpty {
                    Text(self.placeholder)
                        .foregroundColor(Color.textColor)
                        .opacity(0.4)
                }
                self.inputComponent
                    .autocapitalization(.none);
            }
        }
        .frame(height: 30)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(!onFocus ? Color.textColor : Color.lighting))
    }
    
    private var inputComponent: some View {
        AnyView(CustomTextField(text: $text, isFocused: $onFocus, isSecured: false)
                            .modifierUse())
    }
}

extension CustomTextField {
    func modifierUse() -> CustomTextField {
        textfield.textAlignment = .center
        return self
    }
}
