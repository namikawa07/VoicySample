//
//  AuthPresenter.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//
// 役割：Viewからのイベントを受け取って処理したりデータを取得するためにInteractorを呼んだりする
//entityを呼ぶのはinteractorだけなのでここではinteractor経由で呼ぶ必要がある
import SwiftUI

// entityで設定したenumをauthSectionとしている
// 方はAuthEntityファイルでenum AuthButtonSectionと設定したのでそれを使用している
private let authSections: [AuthButtonSection] = [
    .google,
    .twitter,
    .apple,
    .facebook
]

// finalをつけることでAuthPresenterクラスはこれ以上継承できなくなる
final class AuthPresenter: AuthPresenterProtocol {
    private var entity: AuthEntity
    // interactorプロトコルからinteractorインスタンスを作成
    // 確実にnilではない場合に!をつけるinteracoterがnilの場合にはランタイムエラーが表示される
    private var interactor: AuthInteractorProtocol!
    
    
    init(entity: AuthEntity) {
        self.entity = entity
        load()
    }
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.entity.isLoaded = true
        }
    }
    
    //injectでこのAuthPresenterにinteractorの依存性を注入している
    //これによってAuthPresenterはAuthInteractorに依存するようになる
    //injectはインスタンス生成後に依存性を注入できるもの
    func inject(interactor: AuthInteractorProtocol) {
        self.interactor = interactor
    }
    
    func onTapAuthButton(section: AuthButtonSection) {
        switch section {
        case .google:
            authenticateWithGoogle()
        case .apple:
            authenticateWithApple()
        case .line:
            authenticateWithLINE()
        case .facebook:
            authenticateWithFacebook()
        case .twitter:
            authenticateWithTwitter()
        }
    }
    
    func authenticateWithGoogle() {
        
    }
    
    func authenticateWithApple() {
        
    }
    
    func authenticateWithFacebook() {
        
    }
    
    func authenticateWithTwitter() {
        
    }
    
    func authenticateWithLINE() {
        
    }
   
}
