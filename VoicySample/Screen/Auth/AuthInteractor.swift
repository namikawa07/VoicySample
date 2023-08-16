//
//  AuthInteractor.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//
// 役割：データを取得するときに使用する
import Foundation

final class AuthInteractor:  AuthInteractorProtocol{
    
    // entityの値が変更する可能性があるのでvarにしている。変更されない場合はletに書き換える
    var entity: AuthEntity
    
    //インスタンス生成時にentityの依存性を注入している
    //AuthEntityを使用できるようになる
    init(entity: AuthEntity){
        self.entity = entity
    }
    
    func firebaseAuthenticationGoogle() {
        
    }
    func firebaseAuthenticationApple() {
        
    }
    func firebaseAuthenticationLINE() {
        
    }
    func firebaseAuthenticationTwitter() {
        
    }
    func firebaseAuthenticationFacebook() {
        
    }
}
