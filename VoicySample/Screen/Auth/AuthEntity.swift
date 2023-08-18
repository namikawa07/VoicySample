//
//  AuthEntity.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//
//データを保持しておき永続化するために使用する
import Foundation

//AuthViewでisLoadedを監視するために @ObservedObject var entity: AuthEntityと書いているのでAuthEntityはObservableObjectを継承しておかないといけない
final class AuthEntity: ObservableObject {
    // letは不変 varは可変
    @Published var isLoaded: Bool
    @Published var showConfirmView: Bool = false
    var selectedSection: AuthButtonSection? = nil
    @Published var currentAuthType: AuthType
    
    //swiftは全てのclassがイニシャライズしないといけないルールがある
    init(isLoaded: Bool, currentAuthType: AuthType
    ){
        self.isLoaded = isLoaded
        self.currentAuthType = currentAuthType
    }
}

// enumを作成

enum AuthType: CaseIterable {
    case signin
    case signup
}
//CaseIterableというプロトコル？を継承することでenumが簡単に使用できるようになる。詳しくはCaseIterableプロトコルの概要を調べる
enum AuthButtonSection: CaseIterable {
    case google
    case apple
    case line
    case facebook
    case twitter
    
    func authButtonText(authType: AuthType) -> String {
        typealias LA = Localizable.Auth
        typealias LL = Localizable.Login
        switch self {
        case .google:
            return authType == .signup ? LA.google.localized : LL.google.localized
        case .apple:
            return authType == .signup ? LA.apple.localized : LL.apple.localized
        case .line:
            return authType == .signup ? LA.line.localized : LL.line.localized
        case .facebook:
            return authType == .signup ? LA.facebook.localized : LL.facebook.localized
        case .twitter:
            return authType == .signup ? LA.twitter.localized : LL.twitter.localized
        }
    }
    
    var authButtonIcon: String {
        typealias L = Localizable.Sns
        switch self {
        case .google:
            return L.google.localized
        case .apple:
            return L.apple.localized
        case .line:
            return L.line.localized
        case .facebook:
            return L.facebook.localized
        case .twitter:
            return L.twitter.localized
        }
        
    }
    
    var authBackgroundColor: String {
        typealias L = Localizable.AuthColor
        switch self {
        case .google:
            return L.Red.localized
        case .apple:
            return L.Black.localized
        case .line:
            return L.Green.localized
        case .facebook:
            return L.Blue.localized
        case .twitter:
            return L.LightBlue.localized
        }
    }
}



