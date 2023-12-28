//
//  LoginView.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State var showPassword = false
    @State private var password = ""
    @State private var primaryButton:ButtonType = .primary
    @FocusState private var passFieldIsFocused: Bool
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                VStack(alignment: .leading , spacing: 11){
                    Text("Welcome back")
                        .font(
                            .custom("TomatoGrotesk-Medium", size: 20)
                        )
                    
                    Text("Let’s get you logged in to get back to building your dollar-denominated investment portfolio.")
                        .font(.custom("DMSans-Regular", size: 15)).foregroundStyle(Color.textSoft)
                }
                Spacer()
            }
            
            
            VStack(spacing: 17){
                
                
                HStack {
                    
                    ZStack(alignment: .leading){
                        
                        
                        HStack{
                            Text("Email address").padding(.horizontal , 10)
                        }.background(.white).offset(y: emailFieldIsFocused == false && email == "" ? 0 : -25).animation(.default, value: emailFieldIsFocused)
                        
                        
                        TextField("", text: $email).focused($emailFieldIsFocused)
                    }.font(.custom("DMSans-Bold", size: 15)).foregroundStyle(Color.riseTextSoft)
                }
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.9, green: 0.91, blue: 0.92), lineWidth: 1)
                )
                
                HStack(alignment: .top) {
                    ZStack(alignment: .leading){
                        
                        HStack{
                            Text("Password").padding(.horizontal , 10)
                        }.background(.white).offset(y: passFieldIsFocused == false && password == "" ? 0 : -25).animation(.default, value: passFieldIsFocused)
                        if(showPassword){
                            TextField("", text: $password).focused($passFieldIsFocused)
                        }else{
                            SecureField("", text: $password ).focused($passFieldIsFocused)
                        }
                    }.foregroundStyle(Color.riseTextSoft).font(.custom("DMSans-Bold", size: 15))
                    
                    Button(action: {
                        
                        showPassword.toggle()
                        
                    }, label: {
                        Image(systemName: showPassword ? "eye.circle" : "eye.slash")
                            .resizable()
                            .frame(width: 24, height: 24).foregroundColor(Color.riseTeal)
                    })
                }.padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.9, green: 0.91, blue: 0.92), lineWidth: 1)
                    )
                
                Button(action: {
                    print("login")
                }, label: {
                    Text("Sign in")
                }).buttonStyle(CustomButtonStyle(type: $primaryButton))
                
                Button(action: {
                    print("forgot password")
                }, label: {
                    Text("I forgot my password").foregroundStyle(Color.riseTeal).font(.custom("DMSans-Bold", size: 15))
                }).padding(.top , 20)
            }.padding(.top , 40)
            
            
            Spacer()
        }.padding().padding(.top , 40)
        
    }
}

#Preview {
    LoginView()
}
