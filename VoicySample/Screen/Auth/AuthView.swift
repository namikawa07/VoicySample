//
//  AuthView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//

// 役割：アプリの見た目を表示させる

import SwiftUI

struct AuthView: View {
    var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width:220)
            
            ForEach(AuthButtonSection.allCases, id: \.self) { section in
                AuthButtonView(buttonText: section.authButtonText, buttonIcon: section.authButtonIcon, backgroundColor: section.authBackgroundColor, action: presenter.onTapAuthButton)
            }

            Button(action: {}){
                HStack(alignment: .center){
                    Text("メールアドレスで登録")
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
                Text("アカウントを持ちの方は")
                    .font(.system(size: 14))
                Text("ログイン")
                    .font(.system(size: 14))
                    .foregroundColor(Color("ColorOrange"))
            }
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AuthPresenter()
        AuthView(presenter: presenter)
    }
}
