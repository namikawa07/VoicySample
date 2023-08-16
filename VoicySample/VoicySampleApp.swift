//
//  VoicySampleApp.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//

import SwiftUI

@main
struct VoicySampleApp: App {
    var body: some Scene {
        WindowGroup {
            let entity = AuthEntity(isLoaded: false)
            let router = AuthRouter()
            let interactor = AuthInteractor(entity: entity)
            var presenter = AuthPresenter(entity: entity, router: router, interactor: interactor)
                        
            AuthView(entity: entity, presenter: presenter)
        }
    }
}
