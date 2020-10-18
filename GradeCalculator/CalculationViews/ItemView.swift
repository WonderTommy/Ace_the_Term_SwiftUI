//
//  ItemView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-13.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    var name: String?
    var points: Double?
    var fullPoints: Double?
    var weight: Double?
    
    @Binding var showItemView: Bool
    @EnvironmentObject var viewModel: GeneralViewModel
    var subject: Subject
    var item: Item?
    
    @State var itemName: String
    @ObservedObject var itemPoints: NumberStringFilter
    @ObservedObject var itemFullPoints: NumberStringFilter
    @ObservedObject var itemWeight: NumberStringFilter
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @State var itemPoint: String = ""
//    @State var itemFullPoints: String = ""
//    @State var itemWeight: String = ""
    
    let viewTitleText = NSLocalizedString("PAGE_TITLE_ADD_ITEM", comment: "")
    let cancelButtonText = NSLocalizedString("BUTTON_TEXT_CANCEL", comment: "")
    let saveButtonText = NSLocalizedString("BUTTON_TEXT_SAVE", comment: "")
    
    let nameFieldHint = NSLocalizedString("TEXT_FIELD_HINT_NAME", comment: "")
    let pointFieldHint = NSLocalizedString("TEXT_FIELD_HINT_POINTS", comment: "")
    let fullPointFieldHint = NSLocalizedString("TEXT_FIELD_HINT_FULL_POINTS", comment: "")
    let weightFieldHint = NSLocalizedString("TEXT_FIELD_HINT_WEIGHT", comment: "")
    
    let defaultItemName = NSLocalizedString("TEXT_FIELD_LABEL_UNKNOWN", comment: "")
    
    let openMode: Mode
    
    var body: some View {
        VStack(spacing: 0) {
            if self.openMode == Mode.New {
                ZStack {
                    Text(viewTitleText).font(.headline).padding()
                    HStack {
                        Button(action: { self.cancelButtonAction() }, label: { Text(cancelButtonText) }).padding()
                        Spacer()
                        Button(action: { self.saveNewButtonAction() }, label: { Text(saveButtonText).bold() }).padding()
                    }
                }
                Divider()
            } else {
                EmptyView()
            }
            VStack {
                Form {
                    Section {
                        TextField(nameFieldHint, text: $itemName)
                        TextField(pointFieldHint, text: $itemPoints.value).keyboardType(.decimalPad)
                        TextField(fullPointFieldHint, text: $itemFullPoints.value).keyboardType(.decimalPad)
                        TextField(weightFieldHint, text: $itemWeight.value).keyboardType(.decimalPad)
                    }
                }
            }
        }.navigationBarItems(trailing: Button(action: { self.saveModifyButtonAction() }, label: { Text(saveButtonText).bold() }))
    }
    
    init(showItemView: Binding<Bool>, in_subject: Subject) {
        self.name = nil
        self.points = nil
        self.fullPoints = nil
        self.weight = nil
        self._showItemView = showItemView
        self.subject = in_subject
        
        print("nothing")
        self._itemName = State(initialValue: "")
        self.itemPoints = NumberStringFilter()
        self.itemFullPoints = NumberStringFilter()
        self.itemWeight = NumberStringFilter()
        self.openMode = Mode.New
        item = nil
    }
    
//    init(showItemView: Binding<Bool>, in_subject: Subject, name: String, points: Double, fullPoints: Double, weight: Double) {
//        print("something")
//        self.name = name
//        self.points = points
//        self.fullPoints = fullPoints
//        self.weight = weight
//        self._showItemView = showItemView
//        self.subject = in_subject
//
//        self._itemName = State(initialValue: name)
//        self.itemPoints = NumberStringFilter(value: points)
//        self.itemFullPoints = NumberStringFilter(value: fullPoints)
//        self.itemWeight = NumberStringFilter(value: weight)
//        self.openMode = Mode.Edit
//    }
    
    init(showItemView: Binding<Bool>, in_subject: Subject, item: Item) {
//        self.init(showItemView: showItemView, in_subject: in_subject, name: item.name, points: item.points, fullPoints: item.fullPoints, weight: item.weight)
        self.name = item.name
        self.points = item.points
        self.fullPoints = item.fullPoints
        self.weight = item.weight
        self._showItemView = showItemView
        self.subject = in_subject
        
        self._itemName = State(initialValue: item.name)
        self.itemPoints = NumberStringFilter(value: item.points)
        self.itemFullPoints = NumberStringFilter(value: item.fullPoints)
        self.itemWeight = NumberStringFilter(value: item.weight)
        self.openMode = Mode.Edit
        self.item = item
    }
    
    // MARK - Button actions
    private func cancelButtonAction() {
        self.showItemView = false
    }
    
    private func saveNewButtonAction() {
        viewModel.addItemForSubject(targetSubject: subject, name: itemName == "" ? defaultItemName : itemName, points: itemPoints.getValueByDouble(), fullPoints: itemFullPoints.getValueByDouble(), weight: itemWeight.getValueByDouble())
        self.showItemView = false
    }
    
    private func saveModifyButtonAction() {
        let modifiedItem = Item(id: self.item!.id, name: itemName == "" ? defaultItemName : itemName, points: itemPoints.getValueByDouble(), fullPoints: itemFullPoints.getValueByDouble(), weight: itemWeight.getValueByDouble())
        viewModel.modifyItemForSubject(targetSubject: self.subject, item: modifiedItem)
        self.presentationMode.wrappedValue.dismiss()
    }
}

enum Mode {
    case New
    case Edit
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView()
//    }
//}
