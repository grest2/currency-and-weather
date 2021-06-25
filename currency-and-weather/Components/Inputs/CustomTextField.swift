//
//  CustomTextField.swift
//  currency-and-weather
//
//  Created by iOS Developer on 6/25/21.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable,View {
    @Binding var text: String
    @Binding var isFocused: Bool
    let textfield = UITextField()
    var isSecured: Bool
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextField {
        
        textfield.isUserInteractionEnabled = true
        textfield.delegate = context.coordinator
        return textfield
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, isFocused: $isFocused)
    }
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = isSecured
    }
    class Coordinator : NSObject,UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        
        init(text: Binding<String>,isFocused: Binding<Bool>) {
            _text = text
            _isFocused = isFocused
        }
        func textFieldDidChangeSelection(_ textField: UITextField)  {
            text = textField.text ?? ""
        }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = true
            }
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = false
            }
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
