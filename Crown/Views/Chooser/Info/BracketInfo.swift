//
//  BracketInfo.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/1/22.
//

import SwiftUI

struct BracketInfo: View {
    var body: some View {
        Text("Create a bracket style compeitition where individuals face off against each other in a knockout tournament")
            .padding()
            .font(.system(size: 18, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.Yellow)     }
}

struct BracketInfo_Previews: PreviewProvider {
    static var previews: some View {
        BracketInfo()
    }
}
