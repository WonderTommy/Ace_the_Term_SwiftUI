//
//  ThirdNavView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-03.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct ThirdNavView: View {
    var body: some View {
        NavigationView {
            Color.red.overlay (
                Text("This View has not been implemented")
            ).navigationBarTitle(NSLocalizedString("TAB_LABEL_SETTING", comment: ""))
        }
    }
}

struct ThirdNavView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdNavView()
    }
}
