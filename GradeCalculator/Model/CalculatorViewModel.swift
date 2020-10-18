//
//  CalculationViewModel.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-03.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import Foundation

class GeneralViewModel: ObservableObject {
    @Published private var model: CalculatorModel = GeneralViewModel.createModel()
    
    private static func createModel() -> CalculatorModel {
        return CalculatorModel()
    }
    
    public func getSubjects() -> Array<Subject> {
        return self.model.subjects
    }
    
    public func getSubject(targetSubject: Subject) -> Subject {
        var result: Subject?
        for subject in self.model.subjects {
            if (targetSubject == subject) {
                result = subject
            }
        }
        return result!
    }
    
    public func addItemForSubject(targetSubject: Subject, name: String, points: Double, fullPoints: Double, weight: Double) {
        model.addItemForSubject(targetSubject: targetSubject, name: name, points: points, fullPoints: fullPoints, weight: weight)
    }
    
    public func modifyItemForSubject(targetSubject: Subject, item: Item) {
        model.modifyItemForSubject(targetSubject: targetSubject, item: item)
    }
}
