//
//  ResultView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-16.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: GeneralViewModel
    @State var showSaveAlert: Bool = false
    private var subject: Subject
    private var subjectTitle: String {
        get {
            self.subject.title
        }
    }
    private var subjectItems: Array<Item> {
        get {
            self.subject.items
        }
    }
    
    private let navigationTitle = NSLocalizedString("PAGE_TITLE_RESULT", comment: "")
    private let saveButtonText = NSLocalizedString("BUTTON_TEXT_SAVE", comment: "")
    
    private let totalScoreLabel = NSLocalizedString("RESULT_ITEM_LABEL_TOTAL", comment: "")
    private let highestPossibleLabel = NSLocalizedString("RESULT_ITEM_LABEL_HIGHEST_POSSITLE", comment: "")
    private let percentageLostLabel = NSLocalizedString("RESULT_ITEM_LABEL_POINTS_LOST", comment: "")
    
    private let messageUnder = NSLocalizedString("RESULT_MESSAGE_UNDER", comment: "")
    private let messageOver = NSLocalizedString("RESULT_MESSAGE_OVER", comment: "")
    private let messageOK = NSLocalizedString("RESULT_MESSAGE_OK", comment: "")
    
    private let alertTitleText = NSLocalizedString("BUTTON_TEXT_SAVE", comment: "")
    private let alertMessageText = NSLocalizedString("ALERT_MESSAGE_SAVE_RESULT_TO_HISTORY", comment: "")
    
    private var totalScore: Double
    private var highestPossible: Double
    private var percentageLost: Double
    private var totalPercentage: Double
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack(alignment: .center) {
                Text(totalScoreLabel)
                    .bold()
                    .font(.system(size: 40))
                Text("\(String(self.totalScore))%")
                .font(.system(size: 32))
            }
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(highestPossibleLabel)
                        .bold()
                        .font(.system(size: 28))
                    Text("\(String(highestPossible))%")
                    .font(.system(size: 20))
                }
                Spacer()
                VStack(alignment: .center) {
                    Text(percentageLostLabel)
                        .bold()
                        .font(.system(size: 28))
                    Text("\(String(percentageLost))%")
                    .font(.system(size: 20))
                }
                Spacer()
            }
            Spacer()
            Text("\(self.totalPercentage == 100.0 ? messageOK : self.totalPercentage < 100.0 ? messageUnder : messageOver )\(self.totalPercentage == 100.0 ? "" : " (\(String(totalPercentage))%)")")
            .bold()
            .padding()
                .foregroundColor(self.totalPercentage == 100.0 ? viewModel.getOkColor() : self.totalPercentage < 100.0 ? viewModel.getRemainderColor() : viewModel.getWarningColor())
            Spacer()
        }.navigationBarTitle(navigationTitle)
        .navigationBarItems(trailing:
            Button(action: { self.showSaveSaveAlert() },
                   label: { Text(saveButtonText).bold() })
                .alert(isPresented: self.$showSaveAlert) {
                    Alert(title: Text(alertTitleText),
                          message: Text(alertMessageText),
                          primaryButton: .default(Text(saveButtonText).bold(), action: { self.viewModel.addHistoryRecord(subject: self.subject) }),
                          secondaryButton: .cancel())
        })
    }
    
    init(subject: Subject) {
        self.subject = subject
        self.totalScore = CalculationUtility.summationScore(items: subject.items)
        self.highestPossible = 100 - CalculationUtility.summationPercentageLost(items: subject.items)
        self.percentageLost = CalculationUtility.summationPercentageLost(items: subject.items)
        self.totalPercentage = CalculationUtility.summationPercentage(items: subject.items)
    }
    
    private func showSaveSaveAlert() {
        self.showSaveAlert = true
//        viewModel.addHistoryRecord(subject: self.subject)
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
