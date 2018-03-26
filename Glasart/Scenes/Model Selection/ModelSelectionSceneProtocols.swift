//
//  ModelSelectionView.swift
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// ModelSelection View Protocol
///
public protocol ModelSelectionView : class {
    func show(something:String)
}

///
/// ModelSelection Presenter Protocol
///
public protocol ModelSelectionModule : class {
    func doSomething()
}

///
/// ModelSelection Interactor Input Protocol
///
public protocol ModelSelectionInput : class {
    func get(something:String)
}

///
/// ModelSelection Interactor Output Protocol
///
public protocol ModelSelectionOutput : class {
    func fetch(something:String)
}

///
/// ModelSelection Router Protocol
///
public protocol ModelSelectionWireframe : class {
    func gotoSomeplace()
}
