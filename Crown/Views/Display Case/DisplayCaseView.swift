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
            
            Text("crowns earned from competitions will appear here")
                .multilineTextAlignment(.center)
                .foregroundColor(Color.Yellow)
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 250)
            
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
