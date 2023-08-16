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
    
    //swiftは全てのclassがイニシャライズしないといけないルールがある
    init(isLoaded: Bool
    ){
        self.isLoaded = isLoaded
    }
}

// enumを作成
//CaseIterableというプロトコル？を継承することでenumが簡単に使用できるようになる。詳しくはCaseIterableプロトコルの概要を調べる
enum AuthButtonSection: CaseIterable {
    case google
    case apple
    case line
    case facebook
    case twitter
    
    var authButtonText: String {
        typealias L = Localizable.Auth
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



