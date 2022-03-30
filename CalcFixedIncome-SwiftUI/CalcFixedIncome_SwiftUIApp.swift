//
//  CalcFixedIncome_SwiftUIApp.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import SwiftUI

@main
struct CalcFixedIncome_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InputValuesView()
                    .environmentObject(InputValuesViewModel())
            }
            .accentColor(.black)
        }
    }
}
