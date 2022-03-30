//
//  InputValuesViewModel.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import UIKit
import Combine

class InputValuesViewModel: ObservableObject {
    
    @Published var initialValue = ""
    @Published var monthlyContribuition = ""
    @Published var anualRate = ""
    @Published var initialDate = Date()
    @Published var finalDate = Date()
    @Published var shouldShowMonthlyIncomes = false
    
    var isConfirmButtonEnabled: Bool {
        initialValue != "" &&
        monthlyContribuition != "" &&
        anualRate != ""
    }
    
    var monthlyIncomes = Items()
    
    func checkValues() {
        guard let initialValue = initialValue.withoutCurrencyValue,
              let monthlyContribuition = monthlyContribuition.withoutCurrencyValue,
              let anualRate = Double(anualRate.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "%", with: "")),
              initialValue > 0,
              monthlyContribuition > 0,
              anualRate > 0 else {
                return
              }
        
        let values = Values(initialValue: initialValue,
                            monthlyContribuition: monthlyContribuition,
                            anualRate: anualRate,
                            initialDate: initialDate,
                            finalDate: finalDate)
        
        monthlyIncomes = monthlyIncomes(for: values).sorted(by: { $0.date < $1.date })
        shouldShowMonthlyIncomes = true
    }
    
    func monthlyIncomes(for values: Values) -> Items {
        var date = values.initialDate.noon
        var monthlyIncomes = Items()
        var value = values.initialValue
        let monthlyRate = ((values.anualRate / 12) / 100) + 1
        
        
        while date <= values.finalDate.noon {
            value *= monthlyRate
            value += values.monthlyContribuition
            
            monthlyIncomes.append(Item(date: date, value: value))
            
            date = Calendar.current.date(byAdding: .month, value: 1, to: date)!
        }
        
        return monthlyIncomes
    }
}
