//
//  DirectResultViewModel.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import Foundation
import Combine

class DirectResultViewModel: ObservableObject {
    
    @Published var monthlyIncomes: Items
    
    var firstIncome: Item {
        monthlyIncomes.first!
    }
    
    var lastIncome: Item {
        monthlyIncomes.last!
    }
    
    init(monthlyIncomes: Items) {
        self.monthlyIncomes = monthlyIncomes
    }
}
