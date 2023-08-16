//
//  AuthContract.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//
// protocolを定義する際に使用する
import Foundation

// interactor
protocol AuthInteractorProtocol {
    func firebaseAuthenticationGoogle()
    func firebaseAuthenticationApple()
    func firebaseAuthenticationLINE()
    func firebaseAuthenticationTwitter()
    func firebaseAuthenticationFacebook()
}

// router
protocol AuthRouterProtocol {
    func transitionHomeScreen()
}

// presenter
protocol AuthPresenterProtocol {
    func onTapAuthButton()
    func tapOpenDialog(section: AuthButtonSection)
    func tapCloseDialog()
}

protocol AuthPresenterAuthenticateProtocol {
    func authenticateWithGoogle()
    func authenticateWithApple()
    func authenticateWithFacebook()
    func authenticateWithTwitter()
    func authenticateWithLINE()
}
