//
//  ForgotPasswordView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userInfo : UserInfo
    
    var body: some View {
        
        HStack{
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            }
        label: {
            Image(systemName: "multiply.circle.fill")
                .font(.title2)
                .accentColor(Color.Gray)
        }
        }
        .padding()
        .padding(.top, -310)

        HStack{
            Text("Forgot Password")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color.Gray)
            Spacer()
        }
        .padding()
        .padding(.top, -290)
        
        VStack(spacing: 16){
            
            TextField("Email", text: $userInfo.email)
                .frame(maxWidth: .infinity,
                       minHeight: 44)
                .padding(.leading, 30)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .foregroundColor(Color.Gray.opacity(0.5))
                .background(
                    
                    ZStack(alignment: .leading){
                        
                        
                        Image(systemName: "envelope")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.Gray.opacity(0.5))
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.Gray.opacity(0.5))
                    }
                )
            
            ButtonView(title: "Send Request",
                       background: Color.Yellow,
                       foreground: Color.white,
                       border: Color.Yellow){
                FirebaseFunctions.forgotPassword(email: userInfo.email){ success in
                    //add alert if email address invalid
                }
                presentationMode.wrappedValue.dismiss()
            }
            
        }
        .padding(.horizontal, 15)
        .navigationTitle("Forgot Password")
        .navigationBarItems(trailing: Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "x.circle.fill")
                .font(.title2)
                .accentColor(Color.Gray)
        })
        
    }
}
struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

