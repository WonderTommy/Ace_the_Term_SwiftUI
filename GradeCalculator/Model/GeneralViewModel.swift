//
//  CalculationViewModel.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-03.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import Foundation
import SwiftUI

class GeneralViewModel: ObservableObject {
    @Published private var calculatorModel: CalculatorModel = GeneralViewModel.createCalculatorModel()
    @Published private var historyModel: HistoryModel = GeneralViewModel.createHistoryModel()
    @Published private var settingModel: SettingModel = GeneralViewModel.createSettingModel()
    
    
    // MARK - Calculator Model
    private static func createCalculatorModel() -> CalculatorModel {
        return CalculatorModel()
    }
    
    private static func createHistoryModel() -> HistoryModel {
        return HistoryModel()
    }
    
    private static func createSettingModel() -> SettingModel {
        return SettingModel()
    }
    
    // MARK - Calculator Model interface
    public func addSubject(title: String, items: Array<Item>?) {
        self.calculatorModel.addSubject(title: title, items: items)
    }
    
    public func removeSubject(removeSubject: Subject) {
        self.calculatorModel.removeSubject(removeSubject: removeSubject)
    }
    
    public func getSubjects() -> Array<Subject> {
        return self.calculatorModel.subjects
    }
    
    public func getSubject(targetSubject: Subject) -> Subject? {
        var result: Subject?
        for subject in self.calculatorModel.subjects {
            if (targetSubject == subject) {
                result = subject
            }
        }
        return result
    }
    
    public func addItemForSubject(targetSubject: Subject, name: String, points: Double, fullPoints: Double, weight: Double) {
        calculatorModel.addItemForSubject(targetSubject: targetSubject, name: name, points: points, fullPoints: fullPoints, weight: weight)
    }
    
    public func modifyItemForSubject(targetSubject: Subject, item: Item) {
        calculatorModel.modifyItemForSubject(targetSubject: targetSubject, item: item)
    }
    
    // MARK - History Model Interface
    public func addHistoryRecord(subject: Subject) {
        self.historyModel.addRecord(subject: subject)
    }
    
    public func getRecords() -> Array<HistoryItem> {
        return self.historyModel.records
    }
    
    // MARK - Setting Model Interface
    
    public func getWarningColor() -> Color {
        return settingModel.warningColor
    }
    
    public func getRemainderColor() -> Color {
        return settingModel.remainderColor
    }
    
    public func getOkColor() -> Color {
        return settingModel.okColor
    }
}
