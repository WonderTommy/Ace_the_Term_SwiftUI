//
//  CheckBox.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-23.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct CheckBox: View {
    @State var checked: Bool = false
    
    
    var body: some View {
//        HStack {
//            Circle().border(Color.gray, width: 5)
//        }.frame(width: 20, height: 20).foregroundColor(self.checked ? .blue : .red)
//            .onTapGesture {
//                self.toggleChecked()
//        }
        Circle().frame(width: 20, height: 20).foregroundColor(.gray)
            .overlay(Circle().frame(width: 18, height: 18)
                .foregroundColor(self.checked ? Color.blue : Color.white)
                .onTapGesture {
                    self.toggleChecked()
                }
            )
        
    }
    
    private func toggleChecked() {
        self.checked = !self.checked
        print("check box \(self.checked ? "checked" : "unchecked")")
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
