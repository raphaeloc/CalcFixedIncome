//
//  DirectResultView.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import SwiftUI

struct DirectResultView: View {
    
    @EnvironmentObject var viewModel: DirectResultViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            
            Text("initial income:")
            
            HStack {
                Text(Formatter.date.string(from: viewModel.firstIncome.date))
                    .font(.system(size: 18, weight: .light))
                
                Text(viewModel.firstIncome.value.currency ?? "")
                    .font(.system(size: 28, weight: .regular))
                
            }
            
            Text("final income:")
            
            HStack {
                Text(Formatter.date.string(from: viewModel.lastIncome.date))
                    .font(.system(size: 18, weight: .light))
                
                Text(viewModel.lastIncome.value.currency ?? "")
                    .font(.system(size: 28, weight: .regular))
            }
            
            Spacer()
            
            NavigationLink("open list") {
                MonthlyIncomesView()
                    .environmentObject(MonthlyIncomesViewModel(monthlyIncomes: viewModel.monthlyIncomes))
            }
            .font(.system(size: 18, weight: .semibold))
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(Rectangle().fill(.black))
            .foregroundColor(.white)
            .cornerRadius(16)
        }
        .padding(.horizontal, 16)
        .navigationTitle("direct result")
    }
}

struct DirectResultView_Previews: PreviewProvider {
    static var previews: some View {
        DirectResultView()
            .environmentObject(DirectResultViewModel(monthlyIncomes: [
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200),
                Item(date: Date(), value: 200)
            ]))
    }
}
