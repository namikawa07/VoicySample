//
//  AuthView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//

// 役割：アプリの見た目を表示させる

import SwiftUI

struct AuthView: View {
    @ObservedObject var entity: AuthEntity
    var presenter: AuthPresenter
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if (entity.currentAuthType == .signup) {
            AuthContentView(entity: entity, presenter: presenter).navigationBarTitle("", displayMode: .inline)
        } else {
            AuthContentView(entity: entity, presenter: presenter)
                .navigationBarTitle("ログイン", displayMode: .inline)
                .customBackButton()
        }
    }
}

struct AuthContentView: View{
    @ObservedObject var entity: AuthEntity
    var presenter: AuthPresenter
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:220)
                    .offset(y: entity.isLoaded ? 0 : 170)
                    .animation(.easeInOut(duration: 0.5), value: entity.isLoaded)
                    .zIndex(2)
                VStack {
                    ForEach(AuthButtonSection.allCases, id: \.self) { section in
                        AuthButtonView(buttonText: section.authButtonText(authType: entity.currentAuthType), buttonIcon: section.authButtonIcon, backgroundColor: section.authBackgroundColor, action: {presenter.tapOpenDialog(section: section)})
                    }
                    
                    if entity.currentAuthType == .signup {
                        Button(action: {
                            presenter.tapEmailButton()
                        }){
                            HStack(alignment: .center){
                                Text(entity.currentAuthType == .signup ? Localizable.Auth.email.localized : Localizable.Login.email.localized)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(Localizable.Color.LightGray.localized), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal, 50)
                    } else {
                        NavigationLink(destination: LoginView(entity: LoginEntity())){
                            
                            HStack(alignment: .center){
                                Text(entity.currentAuthType == .signup ? Localizable.Auth.email.localized : Localizable.Login.email.localized)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(Localizable.Color.LightGray.localized), lineWidth: 1)
                            )
                            
                        }
                        
                    }
                    
                    
                    if entity.currentAuthType == .signup {
                        Rectangle()
                            .fill(Color(Localizable.Color.LightGray.localized)) // 線の色
                            .frame(height: 1) // 線の太さ
                            .padding(.horizontal, 10)
                            .padding(.vertical, 30)
                        
                        HStack(){
                            Text(Localizable.Auth.alreadyHasAccount.localized)
                                .font(.system(size: 14))
                            
                            NavigationLink(destination: AuthView(entity: AuthEntity(isLoaded: true, currentAuthType: .signin), presenter: presenter)){
                                Text(Localizable.Auth.login.localized)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(Localizable.AuthColor.Orange.localized))
                            }
                            
                        }
                    } else {
                        Button(action: {}) {
                            Text("よくある質問(FAQ)")
                                .font(.system(size: 14))
                                .foregroundColor(Color(Localizable.AuthColor.Orange.localized))
                                .padding(.vertical, 30)
                        }
                        Button(action: {}) {
                            Text("ログイン方法を問い合わせる")
                                .font(.system(size: 14))
                                .foregroundColor(Color(Localizable.AuthColor.Orange.localized))
                        }
                    }
                    
                    
                }
                .opacity(entity.isLoaded ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: entity.isLoaded)
                Spacer().frame(height: entity.currentAuthType == .signin ? 24 : 0)
            }
            .zIndex(0)
            
            
            if entity.showConfirmView {
                AuthConfirmView(presenter: presenter)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                    .zIndex(100)
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        let entity = AuthEntity(isLoaded: false, currentAuthType: .signup)
        let router = AuthRouter()
        let interactor = AuthInteractor(entity: entity)
        var presenter = AuthPresenter(entity: entity, router: router, interactor: interactor)
        AuthView(entity: entity, presenter: presenter)
    }
}
