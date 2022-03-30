//
//  PercentageTextField.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 30/03/22.
//

import Foundation
import SwiftUI

struct PercentageTextField: UIViewRepresentable {
    
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
            let justValue = textField.text?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "%", with: "") ?? ""
            let percentageSymbol = justValue.isEmpty ? "" : "% "
            textField.text = "\(percentageSymbol)\(justValue)"
            text = textField.text ?? ""
        }
    }
}
