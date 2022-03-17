//
//  FindView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/15/22.
//

import SwiftUI

struct FindView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        VStack{
            TextField("Search", text: $search)
                .frame(maxWidth: .infinity,
                       minHeight: 44)
                .padding(.leading, 45)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .foregroundColor(Color.Gray.opacity(0.5))
                .background(
                    
                    ZStack(alignment: .leading){
                        
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 10)
                            .foregroundColor(Color.Gray.opacity(0.5))
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.Gray.opacity(0.5))
                            .frame(maxWidth: 410)
                    }
                )
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
