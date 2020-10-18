//
//  NewSubjectView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-22.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct NewSubjectView: View {
    @Binding var isShowing: Bool
    @EnvironmentObject var viewModel: GeneralViewModel
    @State var newSubjectName: String = ""
    
    let cancelButtonText = NSLocalizedString("BUTTON_TEXT_CANCEL", comment: "")
    let saveButtonText = NSLocalizedString("BUTTON_TEXT_SAVE", comment: "")
    let titleText = NSLocalizedString("PAGE_TITLE_ADD_SUBJECT", comment: "");
    let nameHintText = NSLocalizedString("TEXT_FLEID_HINT_SUBJECT_NAME", comment: "")
    let subjectDefaultName = NSLocalizedString("TEXT_FIELD_LABEL_UNKNOWN", comment: "")
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.cancelButtonAction() }, label: { Text(cancelButtonText) })
                Spacer()
            }.padding()
            Spacer()
            VStack {
                Text(titleText).bold().font(.system(size: 30)).padding()
                TextField(nameHintText, text: self.$newSubjectName)
                    .frame(width: 300, alignment: .center)
                    .padding(.bottom, 30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack(alignment: .center) {
                    Text(saveButtonText).foregroundColor(Color.white)
                }
                .frame(width: 132, height: 50)
                .background(Color.green.cornerRadius(5))
                .onTapGesture {
                    self.saveButtonAction()
                }.padding()
            }
            Spacer()
        }
    }
    
    init(isShowing: Binding<Bool>) {
        self._isShowing = isShowing
    }
    
    private func cancelButtonAction() {
        self.isShowing = false
    }
    
    private func saveButtonAction() {
        self.isShowing = false
        viewModel.addSubject(title: self.newSubjectName == "" ? subjectDefaultName : self.newSubjectName, items: nil)
    }
}

//struct NewSubjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewSubjectView()
//    }
//}
