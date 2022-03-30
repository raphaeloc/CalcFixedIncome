//
//  UIApplication+Utils.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 30/03/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
