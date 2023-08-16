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
            let entity = AuthEntity(isLoaded: false) // ここで適切な値を設定する必要があります
            let presenter = AuthPresenter(entity: entity)
                        
            AuthView(entity: entity, presenter: presenter)
        }
    }
}
