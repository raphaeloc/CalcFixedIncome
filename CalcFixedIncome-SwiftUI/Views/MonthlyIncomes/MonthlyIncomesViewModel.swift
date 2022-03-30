//
//  MonthlyIncomesViewModel.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import Foundation
import Combine

class MonthlyIncomesViewModel: ObservableObject {
    
    @Published var monthlyIncomes: Items
    
    init(monthlyIncomes: Items) {
        self.monthlyIncomes = monthlyIncomes
    }
}
