//
//  Values.swift
//  CalcFixedIncome-SwiftUI
//
//  Created by Raphael de Oliveira Chagas on 29/03/22.
//

import Foundation

struct Values {
    
    let initialValue: Double
    let monthlyContribuition: Double
    let anualRate: Double
    let initialDate: Date
    let finalDate: Date
}

typealias Items = [Item]

struct Item: Hashable {
    var date: Date
    var value: Double
}
