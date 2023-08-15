//
//  AuthEntity.swift
//  VoicySample
//
//  Created by 並川樹 on 2023/08/15.
//
//データを保持しておき永続化するために使用する
import Foundation

final class AuthEntity {
    // letは不変 varは可変
    let section: AuthButtonSection
    var action: () -> Void = {}
    
    //swiftは全てのclassがイニシャライズしないといけないルールがある
    // TODO:@escapingについてコメント書く
    init(section: AuthButtonSection, action: @escaping () -> Void){
        self.section = section
        self.action = action
    }
}

// enumを作成
//CaseIterableというプロトコル？を継承することでenumが簡単に使用できるようになる。詳しくはCaseIterableプロトコルの概要を調べる
enum AuthButtonSection: CaseIterable {
    case google
    case twitter
    case apple
    case facebook
}
