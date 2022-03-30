//
//  MonthlyIncomesView.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import SwiftUI

struct MonthlyIncomesView: View {
    
    @EnvironmentObject var viewModel: MonthlyIncomesViewModel
    
    var body: some View {
        
        List {
            ForEach($viewModel.monthlyIncomes, id:\.self) { monthlyIncome in
                
                HStack {
                    Text(Formatter.date.string(from: monthlyIncome.date.wrappedValue))
                        .font(.system(size: 14, weight: .light))
                    
                    Text(monthlyIncome.value.wrappedValue.currency ?? "")
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("monthly incomes")
    }
}

struct MonthlyIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyIncomesView()
            .environmentObject(MonthlyIncomesViewModel(monthlyIncomes: [
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200)
            ]))
    }
}
