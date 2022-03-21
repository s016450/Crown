//
//  PreviewTimeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/21/22.
//

import SwiftUI

struct CustomizeTimeView: View {
    
    @State private var showAccountView = false
    
    var body: some View {
        Button(action: {
            showAccountView = true
        }, label: {
            Image(systemName: "paintbrush.fill")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(Color.Yellow)
                .clipShape(Circle())
                .shadow(color: Color.Yellow.opacity(0.6), radius: 5, x: 0, y: 0)
        })
        .sheet(isPresented: $showAccountView){
            AccountView()
        }    }
}

struct PreviewTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeTimeView()
    }
}
