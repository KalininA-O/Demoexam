//
//  SwiftUIView.swift
//  Test_project
//
//  Created by user on 08.10.2024.
//

import SwiftUI

struct Login: View {
    @State private var NavigationHome: Bool = false
    @StateObject var authViewModel = AuthViewModel()
    @State private var error: Bool = false
    @State private var isProgress: Bool = false
    @State private var isNavigate: Bool = false
    @State private var showingAlert = false
    @State var col: Color = Color.gray
    @State private var checkBox: Bool = false
    @State var img: String = "eye.slash"
    @State var bol:Bool=true
    @State var changeEmail:Bool=false
    @AppStorage("password") var savepassword: String = "******"
    var body: some View {
        
        NavigationView{
            VStack{
                NavigationLink(destination: Home(), isActive: $NavigationHome)
                {EmptyView()}
                HStack{
                    Text("Welcome Back")
                        .padding(.leading, 10)
                    
                        .font(.custom("Roboto-black",size:20))
                    
                    
                    Spacer()
                }
                HStack{
                    Text("Fill in your email and password to continue")
                        .padding(.leading, 10)
                        .padding(.top,1)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    Text("Email Address")
                        .padding(.leading,10)
                        .padding(.top,10)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    TextField("login", text: $authViewModel.login, onEditingChanged: {change in changeEmail = true})
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                        .opacity(0.5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading,10)
                        .cornerRadius(10)
                    Spacer()
                    
                }
                HStack{
                    Text("Password")
                        .padding(.leading,10)
                        .padding(.top,10)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    ZStack{
                        if bol {
                            SecureField("pass", text: $authViewModel.password)
                                .foregroundColor(.gray)
                                .font(.custom("Roboto-black",size:10))
                                .opacity(0.5)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading,10)
                                .cornerRadius(10)
                        }
                        else
                        {
                            TextField("pass", text: $authViewModel.password)
                                .foregroundColor(.gray)
                                .font(.custom("Roboto-black",size:10))
                                .opacity(0.5)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading,10)
                                .cornerRadius(10)
                            
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Button(action:{if bol==false{
                                img = "eye.slash"
                                bol = true
                            }
                                else{
                                    img = "eye"
                                    bol = false
                                }})
                            {
                                Image(systemName: img)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }.padding(.top, -10)
                HStack{
                    
                    Custom(value: $checkBox, valueColor: $col)
                        .padding(.leading, 0)
                    ZStack{
                        Text("Remember password                                                                                            ")
                        
                            .foregroundColor(.gray)
                            .font(.custom("Roboto-black",size:10)).padding(.leading, -10)
                        NavigationLink("                                                                                                 Forgot Password?", destination: Forgot() ).padding(.leading,0)
                            .foregroundColor(.blun)
                            .font(.custom("Roboto-black",size:10))
                        Spacer()
                    }.padding(.leading, 5)
                }
                HStack{
                    if(changeEmail)
                    {
                        Button(action:{
                            if(authViewModel.login != "" && authViewModel.password != "")
                            {
                                authViewModel.signIn()
                                if(!authViewModel.error)
                                {
                                    if(checkBox)
                                    {
                                        self.savepassword = authViewModel.password
                                    }
                                    NavigationHome.toggle()
                                }
                                else{
                                    self.showingAlert = true
                                }
                                
                            }
                            else
                            {
                                self.showingAlert = true
                            }
                            
                        }){
                            Text("Log in")
                            
                        }
                        .background(Color.blun)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("Error"),
                                          message: Text("Incorrect login or password"),
                                          dismissButton: .default(Text("OK")))
                                }
                        .buttonStyle(MainButtonStyle(progress: authViewModel.isProgress))
                        

                    }
                    else{
                        Button(action:{}){
                            Text("Log in")
                            
                        }
                        .font(.custom("Roboto-black",size:14))
                        .frame(width: 350, height: 30)
                        .padding(10)
                        .background(Color.gr)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        
                    }
                    
                }.padding(.top,100)
                HStack{
                    ZStack{
                        
                        Text("Already have an account?                        ")
                        
                            .foregroundColor(.gray)
                            .font(.custom("Roboto-black",size:10))
                        
                        NavigationLink("                                       Sign up", destination: SignUp())
                            .foregroundColor(.blun)
                            .font(.custom("Roboto-black",size:10))
                        Spacer()
                    }
                }.padding(10)
                
                
                HStack{
                    Text("or log in using")
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                }
                Image(.gool).frame(width: 10, height: 30)
            }
            .padding(10)
            
            
        }.navigationBarBackButtonHidden()
            .onAppear(){
                authViewModel.password = self.savepassword
            }
    }
}
    


#Preview {
    Login()
}
