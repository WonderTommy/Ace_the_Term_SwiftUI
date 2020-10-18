//
//  FirstNavView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-02.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct CalculationNavView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("firstitem")
                Text("seconditem")
            }.navigationBarTitle("First Page")
        }
    }
}

struct FirstNavView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationNavView()
    }
}
