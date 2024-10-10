//
//  Custom.swift
//  Test_project
//
//  Created by user on 07.10.2024.
//

import SwiftUI

struct Custom: View {
    @Binding var value: Bool
    @Binding var valueColor: Color
        var body: some View {
            Group {
                if value {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .overlay {
                            if value {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                            }
                        }
                } else {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(valueColor, lineWidth: 2)
                        .frame(width: 14, height: 14)
                }
            }
            .onTapGesture {
                self.value.toggle()
            }
        }

}


