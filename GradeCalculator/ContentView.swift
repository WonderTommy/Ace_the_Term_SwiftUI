//
//  ContentView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-02.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct TabView: View {
    private var testLabel = NSLocalizedString("hello_world", comment: "")
    var body: some View {
        Text(testLabel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
