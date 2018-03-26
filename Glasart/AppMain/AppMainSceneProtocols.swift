//
//  AppMainView.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// AppMain View Protocol
///
public protocol AppMainView : class {
    func show(something:String)
}

///
/// AppMain Presenter Protocol
///
public protocol AppMainModule : class {
    func doSomething()
}

///
/// AppMain Interactor Input Protocol
///
public protocol AppMainInput : class {
    func get(something:String)
}

///
/// AppMain Interactor Output Protocol
///
public protocol AppMainOutput : class {
    func fetch(something:String)
}

///
/// AppMain Router Protocol
///
public protocol AppMainWireframe : class {
    func gotoSomeplace()
}
