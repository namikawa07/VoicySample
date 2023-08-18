//
//  LoginView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/18.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var entity: LoginEntity
    
    var body: some View {
        VStack {
            VStack {
                Spacer().frame(height: 24)
                TextField("メールアドレス", text: $entity.inputEmail)
                    .frame(height: 40)
                    .border(Color("ColorLightGray"))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                TextField("パスワード", text: $entity.inputPassword)
                    .frame(height: 40)
                    .border(Color("ColorLightGray"))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {}) {
                    Text("パスワードを忘れた方はこちら")
                        .font(.system(size: 14))
                        .foregroundColor(Color(Localizable.AuthColor.Orange.localized))
                        .padding(.vertical, 30)
                    
                }
                
                if entity.isValidEmail && entity.isValidPassword {
                    Button(action: {
                        
                    }){
                        Text(Localizable.Auth.login.localized)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .padding(13)
                    .frame(maxWidth: .infinity)
                    .background(Color("ColorOrange"))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.horizontal, 80)
                } else {
                    Button(action: {
                        
                    }){
                        Text(Localizable.Auth.login.localized)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .padding(13)
                    .frame(maxWidth: .infinity)
                    .background(Color("ColorOrange").opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.horizontal, 80)
                }
                
                Rectangle()
                    .fill(Color(Localizable.Color.LightGray.localized)) // 線の色
                    .frame(height: 1) // 線の太さ
                    .padding(.horizontal, 10)
                    .padding(.vertical, 30)
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
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitle("メールアドレスでログイン", displayMode: .inline)
        .customBackButton()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let entity = LoginEntity()
        LoginView(entity: entity)
    }
}
