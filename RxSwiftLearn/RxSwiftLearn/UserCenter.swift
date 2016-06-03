//
//  UserCenter.swift
//  RxSwiftLearn
//
//  Created by js on 16/6/1.
//  Copyright © 2016年 js. All rights reserved.
//

import Foundation
import RxSwift

enum LoginState{
    case LoginStateNone
    case LoginStateLogining
    case LoginStateLogined
}

struct UserCenter{
    static var instance = UserCenter()
    
    ///当前登录的用户
    var currentUser: MDUser?
    
    
    var loginState: Variable<LoginState> = Variable(.LoginStateNone)
    
}