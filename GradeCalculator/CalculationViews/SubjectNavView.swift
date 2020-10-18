//
//  SubjectNavView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-13.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct SubjectNavView: View {
    @ObservedObject var viewModel: GeneralViewModel
    @State var editMode: EditMode = .inactive
    @State var showNewItemPopOver: Bool = false
    @Environment(\.presentationMode) var presentation
    @State var onMultiSelect: Bool = false
    
    private let navigationViewTitle = NSLocalizedString("PAGE_TITLE_SUBJECTS", comment: "")
    private var subjectIndex: Int = -1
    
    init(viewModel: GeneralViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.getSubjects()) { subject in
                    HStack {
                        if (self.onMultiSelect) {
                            CheckBox()
                            Spacer()
                        }
                        NavigationLink(destination: self.generateCalculationView(subject: subject)) {
                                Text(subject.title)
                        }.disabled(self.onMultiSelect)
                    }
                }.onDelete(perform: { indexSet in
                    // $0 is the first argument, which is the indexSet in this case
                    indexSet.map { self.viewModel.getSubjects()[$0] }.forEach { subject in
                        print("remove subject at index")
                        self.viewModel.removeSubject(removeSubject: subject)
                    }
                })
            }.navigationBarTitle(Text(navigationViewTitle))
            .navigationBarItems(
                leading:
                    EditButton(),
                trailing:
                    Button(
                        action: {
                            print("plus button clicked")
                            if self.editMode == .active {
                                self.editMode = .inactive
                            }
                            self.showNewItemPopOver = true
                        },
                        label: {
                            Image(systemName: "plus").imageScale(.large).sheet(isPresented: self.$showNewItemPopOver) {
                                NewSubjectView(isShowing: self.$showNewItemPopOver).environmentObject(self.viewModel)
                            }
                    })
            )
            .environment(\.editMode, $editMode)
        }
    }
    
    private func generateCalculationView(subject: Subject) -> some View {
        return CalculationView(subject: subject).environmentObject(viewModel)
    }
}

//struct SubjectNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubjectNavView()
//    }
//}
