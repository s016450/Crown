//
//  CompetitionChooserView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/24/22.
//

import SwiftUI

struct CompetitionChooserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                            .padding()
                            .background(Color.white)
                        
                        Text("Time")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                Button(action: {
                    
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                            .padding()
                            .background(Color.white)
                        
                        Text("Score")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                Button(action: {
                    
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                            .padding()
                            .background(Color.white)
                        
                        Text("Bracket")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.Gray)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                
                Spacer()
                Spacer()
                ButtonView(title: "Create Competition",
                           background: Color.Yellow,
                           foreground: Color.white,
                           border: Color.Yellow){
            
                }
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationTitle("Create Competition")
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle.fill")
                    .font(.title2)
                    .accentColor(Color.Gray)
            })
        }
    }
}


struct CompetitionChooserView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionChooserView()
    }
}
