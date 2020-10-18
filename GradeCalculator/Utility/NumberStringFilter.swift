//
//  NumberStringFilter.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-15.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import Foundation

class NumberStringFilter: ObservableObject {
    @Published var value: String {
        didSet {
            let filteredValue = value.filter { $0.isNumber || $0 == "." }
            
            if value != filteredValue {
                value = filteredValue
            }
        }
    }
    
    init() {
        value = ""
    }
    
    init(value: Double) {
        self.value = String(value)
    }
    
    public func getValueByDouble() -> Double {
        return Double(self.value) ?? 0.0
    }
}
