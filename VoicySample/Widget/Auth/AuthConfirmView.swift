//
//  AuthConfirmView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/16.
//

import SwiftUI

struct AuthConfirmView: View {
    var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            VStack {
                Text(Localizable.Auth.loginConfirm.localized)
                    .padding(25)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 13))
                    .lineSpacing(5)
                    .padding(.top, 10)
                Button(action: {
                    presenter.onTapAuthButton()
                }){
                    Text("同意する")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                }
                .padding(13)
                .frame(maxWidth: .infinity)
                .background(Color("ColorOrange"))
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.horizontal, 35)
                
                Button(action: {
                    presenter.tapCloseDialog()
                }){
                    Text("戻る")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .padding(.bottom, 10)
            }
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .onTapGesture {
            presenter.tapCloseDialog()
        }
    }
}

struct AuthConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        let entity = AuthEntity(isLoaded: false, currentAuthType: .signup)
        let router = AuthRouter()
        let interactor = AuthInteractor(entity: entity)
        var presenter = AuthPresenter(entity: entity, router: router, interactor: interactor)
        AuthConfirmView(presenter: presenter)
    }
}
