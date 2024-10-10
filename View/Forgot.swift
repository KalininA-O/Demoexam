//
//  Forgot.swift
//  Test_project
//
//  Created by user on 08.10.2024.
//

import SwiftUI

struct Forgot: View {
    @State private var NavigationOTP: Bool = false
    @State private var showingAlert = false
    @StateObject var forgetViewModel = ForgetViewModel()
    @State var login: String = "***********@mail.com"
    @State var changeEmail:Bool=false
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink(destination: OTPview(), isActive: $NavigationOTP)
                {EmptyView()}
                HStack{
                    Text("Forgot Password")
                        .padding(.leading, 10)
                    
                        .font(.custom("Roboto-black",size:20))
                    
                    
                    Spacer()
                }
                HStack{
                    Text("Enter your email address")
                        .padding(.leading, 10)
                        .padding(.top,1)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    Text("Email Address")
                        .padding(.leading,10)
                        .padding(.top,50)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    TextField("login", text: $forgetViewModel.email, onEditingChanged: {change in changeEmail = true})
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                        .opacity(0.5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading,10)
                        .cornerRadius(10)
                    Spacer()
                    
                }
                HStack{
                    if(changeEmail)
                    {
                        Button(action:{
                            
                            if(login != "")
                            {
                                forgetViewModel.send()
                                if(!forgetViewModel.error)
                                {
                                    NavigationOTP.toggle()
                                }
                                else
                                {
                                    self.showingAlert = true
                                }
                            }
                            else
                            {
                                self.showingAlert = true
                            }
                            
                        }){
                            Text("Send OTP")
                            
                        }
                        .frame(width: 350, height: 30)
                        .padding(10)
                        .background(Color.blun)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Error"),
                                          message: Text("Incorrect login"),
                                          dismissButton: .default(Text("OK")))
                                }
                        .buttonStyle(MainButtonStyle(progress: forgetViewModel.isProgress))

                    }
                    else{
                        Button(action:{}){
                            Text("Send OTP")
                            
                        }
                        .frame(width: 350, height: 30)
                        .padding(10)
                        .background(Color.gr)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                }.padding(.top,40)
                HStack{
                    ZStack{
                        
                        Text("Remember password? Back to                               ")
                        
                            .foregroundColor(.gray)
                            .font(.custom("Roboto-black",size:10))
                        
                        NavigationLink("                                       Sign in", destination: Login())
                            .foregroundColor(.blun)
                            .font(.custom("Roboto-black",size:10))
                        Spacer()
                    }
                }.padding(10)
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    Forgot()
}
