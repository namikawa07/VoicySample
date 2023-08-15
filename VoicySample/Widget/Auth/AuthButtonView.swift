//
//  AuthButtonView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/16.
//

import SwiftUI

struct AuthButtonView: View {
    var buttonText: String
    var buttonIcon: String
    var backgroundColor: String
    var action: () -> Void
   
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                Image(buttonIcon).resizable().frame(width: 30, height: 30)
                Spacer()
                Text(buttonText)
                    .fontWeight(.bold)
                Spacer()
                
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(backgroundColor))
            .foregroundColor(.white)
            .cornerRadius(25)
        }
        .padding(.horizontal, 50)
    }
}

struct AuthButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonView(buttonText: "Googleで始める", buttonIcon: "Google", backgroundColor: "ColorRed", action: {})
    }
}
