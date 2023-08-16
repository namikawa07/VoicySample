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
    
    var body: some View {
       
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width:220)
                .offset(y: entity.isLoaded ? 0 : 150)
                .animation(.easeInOut(duration: 0.5), value: entity.isLoaded)
                .zIndex(2)
            VStack {
                ForEach(AuthButtonSection.allCases, id: \.self) { section in
                    AuthButtonView(buttonText: section.authButtonText, buttonIcon: section.authButtonIcon, backgroundColor: section.authBackgroundColor, action: {presenter.onTapAuthButton(section: section)})
                }
                
                
                Button(action: {}){
                    HStack(alignment: .center){
                        Text(Localizable.Auth.email.localized)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .foregroundColor(.black)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(50)
                
                HStack(){
                    Text(Localizable.Auth.alreadyHasAccount.localized)
                        .font(.system(size: 14))
                    Text(Localizable.Auth.login.localized)
                        .font(.system(size: 14))
                        .foregroundColor(Color(Localizable.AuthColor.orange.localized))
                }
            }
            .opacity(entity.isLoaded ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: entity.isLoaded)
            
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        let entity = AuthEntity(isLoaded: false)
        let presenter = AuthPresenter(entity: entity)
        AuthView(entity: entity, presenter: presenter)
    }
}
