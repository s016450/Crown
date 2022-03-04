//
//  PointInfo.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/1/22.
//

import SwiftUI

struct PointInfo: View {
    var body: some View {
        Text("Create a competition where the winner is determined by who reaches a set number of points first")
            .padding()
            .font(.system(size: 18, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.Yellow)    }
}

struct PointInfo_Previews: PreviewProvider {
    static var previews: some View {
        PointInfo()
    }
}
