//
//  LoginView.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// Login View Protocol
///
public protocol LoginView : class {
    func show(something:String)
}

///
/// Login Presenter Protocol
///
public protocol LoginModule : class {
    func doSomething()
    func login(email:String, password:String)
    func forgotPassword()
    func register()
}

///
/// Login Interactor Input Protocol
///
public protocol LoginInput : class {
    func get(something:String)
}

///
/// Login Interactor Output Protocol
///
public protocol LoginOutput : class {
    func fetch(something:String)
}

///
/// Login Router Protocol
///
public protocol LoginWireframe : class {
    func gotoSomeplace()
    func gotoRegister()
    func gotoInsideApp()
}
