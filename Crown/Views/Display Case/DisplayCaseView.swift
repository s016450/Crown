//
//  DisplayCaseView.swift
//  Crown
//
//  Created by Jonathan  Miller  on 4/23/22.
//

import SwiftUI

struct DisplayCaseView: View {
    var body: some View {
        VStack{
            Text("Display Case")
                .font(.system(size: 35, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top, 30)
            
            Spacer()
        }
        .ignoresSafeArea()
        .padding(.horizontal, 15)
    }
}

struct DisplayCaseView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayCaseView()
    }
}
