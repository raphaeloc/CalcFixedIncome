//
//  CurrencyTextField.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import Foundation
import SwiftUI
import Combine

struct CurrencyTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    let placeholder: String
    let keyboardType: UIKeyboardType

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.borderStyle = .roundedRect
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.didChange(_:)), for: .editingChanged)
        
        textField.keyboardType = keyboardType
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        @objc
        func didChange(_ textField: UITextField) {
            textField.text = textField.text?.currencyValue
            text = textField.text ?? ""
        }
    }
}

extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }

}
