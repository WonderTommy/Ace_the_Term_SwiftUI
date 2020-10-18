//
//  CalculationItemView.swift
//  GradeCalculator
//
//  Created by Hao Li on 2020-08-09.
//  Copyright © 2020 Hao Li. All rights reserved.
//

import SwiftUI

struct CalculationItemView: View {
    var data: Item;
    
    // MARK - constants
    let titleFontSize: CGFloat = 24
    let resultFontSize: CGFloat = 20
    let bodyFontSize: CGFloat = 16
    let pointLabel: String = NSLocalizedString("CALCULATION_ITEM_LABEL_POINTS", comment: "")
    let fullPointLabel: String = NSLocalizedString("CALCULATION_ITEM_LABEL_FULL_POINTS", comment: "")
    let weightLabel: String = NSLocalizedString("CALCULATION_ITEM_LABEL_WEIGHT", comment: "")
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            HStack(alignment: .center) {
                Text(data.name).fontWeight(.bold).font(.system(size: titleFontSize))
                Spacer()
                Text("\(String(data.trueScorePercent))%").fontWeight(.bold).font(.system(size: resultFontSize)).padding(.top, 4)
            }
            HStack(alignment: .center) {
                Text("\(pointLabel)\(String(data.points))").font(.system(size: bodyFontSize)).padding(.top, 4)
                Spacer()
                Text(String(data.trueScore)).font(.system(size: bodyFontSize))
            }
            Text("\(fullPointLabel)\(String(data.fullPoints))").font(.system(size: bodyFontSize)).padding(.top, 4)
            Text("\(weightLabel)\(String(data.weight))%").font(.system(size: bodyFontSize)).padding(.top, 4)
        }.contentShape(Rectangle())
    }
}

//struct CalculationItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculationItemView()
//    }
//}
