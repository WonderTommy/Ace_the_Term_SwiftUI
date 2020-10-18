//
//  ContentView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-02.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var viewModel: GeneralViewModel
    
//    private var testLabel = NSLocalizedString("HELLO_WORLD", comment: "")
    
//    private var firstView: some View = CalculationNavView().tabItem {
//        Image(systemName: "pencil.and.ellipsis.rectangle")
//        Text("Calculate")
//    }
    
    var body: some View {
        TabView {
            generateSubjectNavView()
            generateHistoryNavView()
            
            ThirdNavView().tabItem {
                Image(systemName: "gear").imageScale(.large)
                Text(NSLocalizedString("TAB_LABEL_SETTING", comment: ""))
            }
        }
    }
    
    // MARK - Generate Navigation View for the pages
    private func generateSubjectNavView() -> some View {
        return SubjectNavView(viewModel: self.viewModel).tabItem {
            Image(systemName: "pencil.and.ellipsis.rectangle").imageScale(.large)
            Text(NSLocalizedString("TAB_LABEL_CALCULATION", comment: ""))
        }
    }
    
    private func generateHistoryNavView() -> some View {
        return HistoryNavView(viewModel: self.viewModel).tabItem {
            Image(systemName: "clock.fill").imageScale(.large)
            Text(NSLocalizedString("TAB_LABEL_HISTORY", comment: ""))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(viewModel: GeneralViewModel())
    }
}
