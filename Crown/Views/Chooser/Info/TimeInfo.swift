//
//  TimeInfo.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/1/22.
//

import SwiftUI

struct TimeInfo: View {
    var body: some View {
        Text("Create a competition where the winner is determined by who has the most points at the end of a set time limit")
            .padding()
            .font(.system(size: 18, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.Yellow)
    }
}

struct TimeInfo_Previews: PreviewProvider {
    static var previews: some View {
        TimeInfo()
    }
}
