//
//  RegisterView.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// Register View Protocol
///
public protocol RegisterView : class {
    func show(something:String)
}

///
/// Register Presenter Protocol
///
public protocol RegisterModule : class {
    func doSomething()
}

///
/// Register Interactor Input Protocol
///
public protocol RegisterInput : class {
    func get(something:String)
}

///
/// Register Interactor Output Protocol
///
public protocol RegisterOutput : class {
    func fetch(something:String)
}

///
/// Register Router Protocol
///
public protocol RegisterWireframe : class {
    func gotoSomeplace()
}
