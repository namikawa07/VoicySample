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
    }
    struct Auth {
        static let google = "AuthGoogle"
        static let apple = "AuthApple"
        static let facebook = "AuthFacebook"
        static let twitter = "AuthTwitter"
        static let email = "AuthEmail"
        static let alreadyHasAccount = "AlreadyHasAccount"
        static let login = "Login"
    }
    struct AuthColor {
        static let Red = "ColorRed"
        static let Black = "ColorBlack"
        static let Blue = "ColorBlue"
        static let LightBlue = "ColorLightBlue"
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
