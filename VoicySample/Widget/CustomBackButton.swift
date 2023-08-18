//
//  CustomBackButton.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/18.
//

import SwiftUI

struct CustomBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            Image("Arrow")
                        }
                    ).tint(.orange)
                }
            }
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButton())
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let entity = AuthEntity(isLoaded: false, currentAuthType: .signin)
            let router = AuthRouter()
            let interactor = AuthInteractor(entity: entity)
            var presenter = AuthPresenter(entity: entity, router: router, interactor: interactor)
            AuthView(entity: entity, presenter: presenter).customBackButton()
        }
    }
}
