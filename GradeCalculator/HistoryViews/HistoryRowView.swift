//
//  HistoryRowView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-23.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI
import Foundation

struct HistoryRowView: View {
    @EnvironmentObject var viewModel: GeneralViewModel
    var data: HistoryItem
    
    let titleFontSize: CGFloat = 24
    let resultFontSize: CGFloat = 20
    let bodyFontSize: CGFloat = 16
    
    private var totalPercentage: Double
    
    var body: some View {
        VStack {
            HStack {
                Text(self.data.subject.title).fontWeight(.bold).font(.system(size: titleFontSize))
                Spacer()
                Text(String(CalculationUtility.summationScore(items: self.data.subject.items))).fontWeight(.bold).font(.system(size: resultFontSize))
            }
            HStack {
                Spacer()
                Text("\(String(self.totalPercentage))%").fontWeight(.bold).foregroundColor(self.totalPercentage == 100.0 ? viewModel.getOkColor() : self.totalPercentage < 100.0 ? viewModel.getRemainderColor() : viewModel.getWarningColor())
            }.padding(.top, 4)
            HStack {
                Spacer()
                Text(self.data.time)
            }.padding(.top, 4)
        }
    }
    
    init(data: HistoryItem) {
        self.data = data
        self.totalPercentage = CalculationUtility.summationPercentage(items: data.subject.items)
    }
}

//struct HistoryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryRowView()
//    }
//}
