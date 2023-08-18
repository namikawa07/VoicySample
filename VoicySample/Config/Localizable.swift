//
//  Localizable.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/16.
//

import Foundation

struct Localizable {
    struct Sns {
        static let google = "Google"
        static let apple = "Apple"
        static let facebook = "Facebook"
        static let twitter = "Twitter"
        static let line = "LINE"
    }
    struct Auth {
        static let google = "SignupGoogle"
        static let apple = "SignupApple"
        static let facebook = "SignupFacebook"
        static let twitter = "SignupTwitter"
        static let line = "SignupLINE"
        static let email = "SignupEmail"
        static let alreadyHasAccount = "AlreadyHasAccount"
        static let login = "Login"
        static let loginConfirm = "LoginConfirm"
    }
    struct Login {
        static let google = "SigninGoogle"
        static let apple = "SigninApple"
        static let facebook = "SigninFacebook"
        static let twitter = "SigninTwitter"
        static let line = "SigninLINE"
        static let email = "SigninEmail"
    }
    struct AuthColor {
        static let Red = "ColorRed"
        static let Black = "ColorBlack"
        static let Blue = "ColorBlue"
        static let LightBlue = "ColorLightBlue"
        static let Orange = "ColorOrange"
        static let Green = "ColorGreen"
    }
    
    struct Color {
        static let LightGray = "ColorLightGray"
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
