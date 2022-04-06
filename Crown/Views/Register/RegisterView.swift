//
//  RegisterView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userInfo: UserInfo
    @State var notMatching = false
    
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
        .padding(.top, -225)

        HStack{
            Text("Create Account")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color.Gray)
            Spacer()
        }
        .padding()
        .padding(.top, -205)
        //.padding(.bottom, 400)
        
        VStack(spacing: 32){
            
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
                
                SecureField("Password", text: $userInfo.password)
                    .foregroundColor(Color.Gray.opacity(0.5))
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .background(
                        
                        ZStack(alignment: .leading){
                            
                            Image(systemName: "lock")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.Gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.Gray.opacity(0.5))
                        }
                    )
                
                SecureField("Confirm Password", text: $userInfo.confirmPassword)
                    .foregroundColor(Color.Gray.opacity(0.5))
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .background(
                        
                        ZStack(alignment: .leading){
                            
                            Image(systemName: "lock")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.Gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.Gray.opacity(0.5))
                        }
                    )
            }
            
            ButtonView(title: "Sign Up",
                       background: Color.Yellow,
                       foreground: Color.white,
                       border: Color.Yellow){
                if userInfo.password == userInfo.confirmPassword{
                    FirebaseFunctions.authenticate(email: userInfo.email, password: userInfo.password) {success in
                        if success{
                            userInfo.loggedIn = true
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                else{
                    notMatching = true
                    userInfo.password = ""
                    userInfo.confirmPassword = ""
                }
            }
                       .alert(isPresented: $notMatching){
                           Alert(
                            title: Text("Failed to Create Account"),
                            message: Text("Passwords do not match"),
                            dismissButton: .default(Text("OK")))
                       }
        }
        .padding()
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

