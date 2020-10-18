//
//  RecordDetailView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-23.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct RecordDetailView: View {
    @EnvironmentObject var viewModel: GeneralViewModel
    private var record: HistoryItem
    private var items: Array<Item>
    let titleFontSize: CGFloat = 20
    let resultFontSize: CGFloat = 18
    let bodyFontSize: CGFloat = 16
    var totalPercentage: Double
    var totalScore: Double
    
    let labelTotalScore = NSLocalizedString("LABEL_TOTAL_SCORE", comment: "")
    let labelTime = NSLocalizedString("LABEL_TIME", comment: "")
    
    private let messageUnder = NSLocalizedString("RESULT_MESSAGE_UNDER", comment: "")
    private let messageOver = NSLocalizedString("RESULT_MESSAGE_OVER", comment: "")
    private let messageOK = NSLocalizedString("RESULT_MESSAGE_OK", comment: "")
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("\(labelTotalScore): \(self.totalScore)").fontWeight(.bold).padding().font(.system(size: titleFontSize))
                    Spacer()
                }
                HStack {
                    Text("\(labelTime): \(self.record.time)").fontWeight(.bold).padding().font(.system(size: titleFontSize))
                    Spacer()
                }
            }
            ScrollView {
                VStack {
                    Divider().frame(height: 1).background(Color.gray)
                    ForEach(items) { item in
                        VStack {
                            HStack {
                                Text(item.name).font(.system(size: self.titleFontSize)).fontWeight(.bold).padding(.leading, 12)
                                Spacer()
                                Text("\(String(item.trueScorePercent))%").font(.system(size: self.resultFontSize)).fontWeight(.bold).padding(.trailing, 12)
                            }
                            HStack {
                                Spacer()
                                Text(String(item.trueScore)).font(.system(size: self.bodyFontSize)).padding(.trailing, 12).padding(.top, 4)
                            }
                        }
                        Divider().frame(height: 1).background(Color.gray)
                    }
                }.background(Color(red: 165/255, green: 222/255, blue: 228/255)).cornerRadius(0)
            }.padding().frame(height: 300)
            Text("\(self.totalPercentage == 100.0 ? messageOK : self.totalPercentage < 100.0 ? messageUnder : messageOver )\(self.totalPercentage == 100.0 ? "" : " (\(String(totalPercentage))%)")")
            .bold()
            .padding()
                .foregroundColor(self.totalPercentage == 100.0 ? viewModel.getOkColor() : self.totalPercentage < 100.0 ? viewModel.getRemainderColor() : viewModel.getWarningColor())
            Spacer()
        }
    }
    
    init(record: HistoryItem) {
        self.record = record
        self.items = record.subject.items
        self.totalPercentage = CalculationUtility.summationPercentage(items: items)
        self.totalScore = CalculationUtility.summationScore(items: items)
    }
}

//struct RecordDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordDetailView()
//    }
//}
