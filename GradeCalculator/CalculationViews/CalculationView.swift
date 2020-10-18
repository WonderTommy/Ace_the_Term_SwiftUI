//
//  FirstNavView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-02.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct CalculationView: View {
    @EnvironmentObject var viewModel: GeneralViewModel
    private var initialSubject: Subject
    private var subject: Subject  {
        get { viewModel.getSubject(targetSubject: initialSubject) ?? initialSubject }
    }
    private var subjectTitle: String {
        get { self.subject.title }
    }
    private var subjectItems: Array<Item> {
        get { self.subject.items }
    }
    
    @Environment(\.presentationMode) var presentation
    @State var showItemView: Bool = false

    var body: some View {
        List {
            ForEach(subjectItems) { item in
//                CalculationItemView(data: item)
//                .onTapGesture {
//                    self.showItemView = true
//                }.sheet(isPresented: self.$showItemView, content: {
//                    ItemView(showItemView: self.$showItemView, in_subject: self.subject, item: item).environmentObject(self.viewModel)
//                })
                NavigationLink(destination: ItemView(showItemView: self.$showItemView, in_subject: self.subject, item: item).environmentObject(self.viewModel)) {
                    CalculationItemView(data: item)
                }
            }
        }
        .navigationBarTitle(Text(subjectTitle))
        .navigationBarItems(trailing:
            HStack{
//                Button(
//                    action: {
//                        self.showItemView = true
//                    },
//                    label: {
//                        Text(NSLocalizedString("BUTTON_TEXT_CALCULATE", comment: ""))
//                            .sheet(isPresented: $showItemView, content: {
//                                ItemView(showItemView: self.$showItemView, in_subject: self.subject).environmentObject(self.viewModel)
//                            })
//                    }
//                ).padding(.trailing, 12)
                NavigationLink(destination: ResultView(subject: self.subject).environmentObject(self.viewModel)) {
                    Text(NSLocalizedString("BUTTON_TEXT_CALCULATE", comment: "")).padding(.trailing, 12)
                }
                Button(
                    action: {
                        self.showItemView = true
                    },
                    label: {
                        Image(systemName: "plus").imageScale(.large)
                            .sheet(isPresented: $showItemView, content: {
                                ItemView(showItemView: self.$showItemView, in_subject: self.subject).environmentObject(self.viewModel)
                            })
                    }
                )
            }
        )
    }
    
    init(subject: Subject) {
        self.initialSubject = subject
    }
}

//struct FirstNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculationNavView(viewModel: CalculatorViewModel())
//    }
//}
