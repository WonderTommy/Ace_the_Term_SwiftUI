//
//  SwiftUIView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-02.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct HistoryNavView: View {
    @ObservedObject var viewModel: GeneralViewModel
    
    private var records: Array<HistoryItem> {
        get {
            viewModel.getRecords()
        }
    }
    var body: some View {
        NavigationView {
            List{
                ForEach(records) { record in
                    NavigationLink(destination: RecordDetailView(record: record).environmentObject(self.viewModel)) {
                        HistoryRowView(data: record).environmentObject(self.viewModel)
                    }
                }
            }.navigationBarTitle(NSLocalizedString("TAB_LABEL_HISTORY", comment: ""))
        }
    }
    
    init(viewModel: GeneralViewModel) {
        self.viewModel = viewModel
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryNavView()
//    }
//}
