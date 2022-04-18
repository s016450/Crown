//
//  HomeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @State private var showCompetitionChooser = false
    @State private var showAccountView = false
    @State private var showFirebaseDummy = false
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading,
                   spacing: 16){
                
                Button(action: {
                    showFirebaseDummy = true
                }, label: {
                    Image(systemName: "person")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.Gray)
                        .clipShape(Circle())
                        .shadow(color: Color.Gray.opacity(0.6), radius: 5, x: 0, y: 0)
                })
                
                .sheet(isPresented: $showFirebaseDummy){
                    FirebaseDummy()
                }
                
                Button(action: {
                    showAccountView = true
                }, label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.Gray)
                        .clipShape(Circle())
                        .shadow(color: Color.Gray.opacity(0.6), radius: 5, x: 0, y: 0)
                })
                .sheet(isPresented: $showAccountView){
                    AccountView()
                }
                
                Button(action: {
                    showCompetitionChooser.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.Gray)
                        .padding()
                        .background(Color.white)
                        .overlay(Circle().stroke(Color.Gray, lineWidth: 5))
                        .clipShape(Circle())
                        .shadow(color: Color.Gray.opacity(0.6), radius: 5, x: 0, y: 0)
                })
                .sheet(isPresented: $showCompetitionChooser){
                    CompetitionChooserView()
                }
                
                Spacer()
                VStack(alignment: .leading,
                       spacing: 16){
                    
                    
                }
            }
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea()
        .navigationTitle("Crown")
        .navigationBarItems(leading: Image("crown").resizable().frame(width: 100, height: 100))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}

