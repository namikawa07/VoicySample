//
//  ContentView.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var entity = AuthEntity(isLoaded: false, currentAuthType: .signup)
        var router = AuthRouter()
        var interactor = AuthInteractor(entity: entity)
        var presenter = AuthPresenter(entity: entity, router: router, interactor: interactor)
        
        NavigationView {
            AuthView(entity: entity, presenter: presenter).navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
