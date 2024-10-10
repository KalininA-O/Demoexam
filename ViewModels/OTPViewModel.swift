//
//  OTPViewModel.swift
//  Test_project
//
//  Created by user on 10.10.2024.
//

import Foundation
class OTPViewModel: ObservableObject{
    
    
        
        @Published  var email: String = ""
        @Published  var code: [String] = Array(repeating: "", count: 6)
        
        @Published  var isProgress: Bool = false
        @Published var isNavigate: Bool = false
        @Published  var error: Bool = false
        
        func send() {
            Task {
                do {
                    await MainActor.run {
                        self.isProgress = true
                    }
                    try await Repositories.instance.sendOTP(email: email, code: code.joined())
                    
                    await MainActor.run {
                        self.isNavigate = true
                        self.isProgress = false
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    await MainActor.run {
                        self.error = true
                        self.isProgress = false
                    }
                }
            }
                    }

}

