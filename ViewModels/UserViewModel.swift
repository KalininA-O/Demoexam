//
//  UserViewModel.swift
//  Test_project
//
//  Created by user on 09.10.2024.
//

import Foundation
class UserViewModel: ObservableObject{
    
    @Published var user = UserModel(id: UUID(), name: "Ivanov Ivan", phone_number: "79999999999", created_at: .now)

    @Published  var email: String = "***********@mail.com"
        @Published  var password: String = "**********"
        @Published  var confirmPassword: String = "**********"
        
        @Published  var isProgress: Bool = false
        @Published var isNavigate: Bool = false
        @Published  var error: Bool = false
        
        func signUp() {
                        Task {
                            do {
                                await MainActor.run {
                                    self.isProgress = true
                                }
                                try await Repositories.instance.signUp(name: user.name, phone_number: user.phone_number, email: email, password: password)
                                await MainActor.run {
                                    self.isNavigate = true
                                    self.isProgress = false
                                }
                            } catch {
                                print("ERROR: " + error.localizedDescription)
                                await MainActor.run {
                                    self.error = true
                                    self.isProgress = false
                                }
                            }
                        }
                    }

}

