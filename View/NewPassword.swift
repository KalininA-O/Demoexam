//
//  NewPassword.swift
//  Test_project
//
//  Created by user on 10.10.2024.
//

import SwiftUI

struct NewPassword: View {
    @State var pass: String = "********"
    @State var cpass: String = "********"
    @State var bol:Bool=true
    @State var boll:Bool=true
    @State var img: String = "eye.slash"
    @State var imgg: String = "eye.slash"
    var body: some View {
        NavigationView{
            
            VStack{
                // NavigationLink(destination: NewPassword(), isActive: $NavigationNewPass)
                //{EmptyView()}
                HStack{
                    Text("New Password")
                        .padding(.leading, 10)
                    
                        .font(.custom("Roboto-black",size:20))
                    
                    
                    Spacer()
                }
                HStack{
                    Text("Enter new password")
                        .padding(.leading, 10)
                        .padding(.top,1)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }
                HStack{
                    Text("Password")
                        .padding(.leading,10)
                        .padding(.top,10)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }.padding(.top,20)
                
                HStack{
                    ZStack{
                        if bol {
                            SecureField("Password", text: $pass)
                                .foregroundColor(.gray)
                                .font(.custom("Roboto-black",size:10))
                                .opacity(0.5)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading,10)
                                .cornerRadius(10)
                        }
                        else
                        {
                            TextField("Password", text: $pass)
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
                }.padding(.top,-10)
                HStack{
                    Text("Confirm Password")
                        .padding(.leading,10)
                        .padding(.top,10)
                        .foregroundColor(.gray)
                        .font(.custom("Roboto-black",size:10))
                    Spacer()
                }.padding(.top,-10)
                HStack{
                    ZStack{
                        if boll {
                            SecureField("Confirm Password", text: $cpass)
                                .foregroundColor(.gray)
                                .font(.custom("Roboto-black",size:10))
                                .opacity(0.5)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading,10)
                                .cornerRadius(10)
                        }
                        else
                        {
                            TextField("Confirm Password", text: $cpass)
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
                            Button(action:{if boll==false{
                                imgg = "eye.slash"
                                boll = true
                            }
                                else{
                                    imgg = "eye"
                                    boll = false
                                }})
                            {
                                Image(systemName: imgg)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }.padding(.top,-10)
            }
        }
    }
}

#Preview {
    NewPassword()
}