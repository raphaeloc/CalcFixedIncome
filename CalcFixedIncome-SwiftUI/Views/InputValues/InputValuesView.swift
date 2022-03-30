//
//  ContentView.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import SwiftUI

struct InputValuesView: View {
    
    @EnvironmentObject var viewModel: InputValuesViewModel
    
    var body: some View {
        
        VStack(spacing: 16) {
            ScrollView {
                
                InputValueTextFields(initialValue: $viewModel.initialValue,
                                     monthlyContribuition: $viewModel.monthlyContribuition,
                                     anualRate: $viewModel.anualRate)
                
                VStack(spacing: 8) {
                    DatePicker("initial date", selection: $viewModel.initialDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    DatePicker("final date", selection: $viewModel.finalDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            
            Spacer()
            
            Button("confirm") {
                viewModel.checkValues()
            }
            .font(.system(size: 18, weight: .semibold))
            .tint(.white)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(Rectangle().fill(viewModel.isConfirmButtonEnabled ? Color.black : Color(UIColor.lightGray)))
            .cornerRadius(16)
            .disabled(!viewModel.isConfirmButtonEnabled)
            
            NavigationLink("", isActive: $viewModel.shouldShowMonthlyIncomes) {
                DirectResultView()
                    .environmentObject(DirectResultViewModel(monthlyIncomes: viewModel.monthlyIncomes))
            }
            .hidden()
            .frame(width: 0, height: 0, alignment: .bottom)
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .navigationTitle("input values")
    }
}

struct InputValueTextFields: View {
    
    @Binding var initialValue: String
    @Binding var monthlyContribuition: String
    @Binding var anualRate: String
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            CurrencyTextField(text: $initialValue, placeholder: "initial value", keyboardType: .numberPad)
            
            CurrencyTextField(text: $monthlyContribuition, placeholder: "monthly contribuition", keyboardType: .numberPad)
            
            PercentageTextField(text: $anualRate, placeholder: "anual rate", keyboardType: .numberPad)
        }
    }
}

struct InputValues_Previews: PreviewProvider {
    static var previews: some View {
        InputValuesView()
            .environmentObject(InputValuesViewModel())
    }
}
