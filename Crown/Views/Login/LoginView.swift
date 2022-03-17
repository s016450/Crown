//
//  LoginView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
// 
 
import SwiftUI
 
struct LoginView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Environment(\.presentationMode) var presentationMode
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    @State var correctCredentials = false
    
    var body: some View {
        ZStack{
            
            Rectangle().foregroundColor(Color.white).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16){
                
                Spacer()
                Image("title")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                
                
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
                    
                }
                HStack{
                    Spacer()
                    Button(action: {
                        userInfo.email = ""
                        userInfo.password = ""
                        userInfo.confirmPassword = ""
                        showForgotPassword.toggle()
                    }, label: {
                        Text("Forgot Password?")
                    }).foregroundColor(Color.Yellow)
                    .font(.system(size: 16, weight: .bold))
                    .sheet(isPresented: $showForgotPassword){
                        ForgotPasswordView()
                    }
                }
                VStack(spacing: 16){
                    
                    ButtonView(title: "Login",
                               background: Color.Yellow,
                               foreground: Color.white,
                               border: Color.Yellow){
                        FirebaseFunctions.login(email: userInfo.email, password: userInfo.password){ success in
                            if success{
                                userInfo.loggedIn = true
                            }
                            else{
                                correctCredentials = true
                                userInfo.email = ""
                                userInfo.password = ""
                            }
                        }
                    }
                    .alert(isPresented: $correctCredentials){
                        Alert(
                            title: Text("Failed to Login"),
                            message: Text("Invalid Email or Password"),
                            dismissButton: .default(Text("OK")))
                    }
                    ButtonView(title: "Create Account",
                               background: .clear,
                               foreground: Color.Yellow,
                               border: Color.Yellow){
                        userInfo.email = ""
                        userInfo.password = ""
                        userInfo.confirmPassword = ""
                        showRegistration.toggle()
                    }
                    .sheet(isPresented: $showRegistration,
                           content: {
                            RegisterView()
                           })
                }
                Spacer()
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 15)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView()
        }
    }
}

