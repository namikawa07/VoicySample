//
//  LoginEntity.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/18.
//

import Foundation
import SwiftUI

final class LoginEntity: ObservableObject {
    @Published var inputEmail: String = ""
    @Published var inputPassword: String = ""
    
    
    var isValidEmail: Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPredicate.evaluate(with: inputEmail)
    }

    var isValidPassword: Bool {
        inputPassword.count >= 6
    }
    
}
