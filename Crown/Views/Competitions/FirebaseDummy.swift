//
//  FirebaseDummy.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 4/6/22.
//

import SwiftUI

struct FirebaseDummy: View {
    
    @State var competitionInfo : CompetitionInfo = CompetitionInfo()
   
    var body: some View {
        
        Button("upload") {
            FirebaseFunctions.createUser(competitor: competitionInfo) { userInfo in
                print("user uploaded")
            }
        }
    }
}

struct FirebaseDummy_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseDummy()
    }
}
