//
//  testeView.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// teste View Protocol
///
public protocol testeView : class {
    func show(number:Int)
    func hide()
}

///
/// teste Presenter Protocol
///
public protocol testeModule : class {
    func addNumber()
}

///
/// teste Interactor Input Protocol
///
public protocol testeInput : class {
    func get(something:String)
}

///
/// teste Interactor Output Protocol
///
public protocol testeOutput : class {
    func fetch(something:String)
}

///
/// teste Router Protocol
///
public protocol testeWireframe : class {
    func gotoSomeplace()
}
