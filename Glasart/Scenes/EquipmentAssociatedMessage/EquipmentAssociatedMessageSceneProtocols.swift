//
//  EquipmentAssociatedMessageView.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// EquipmentAssociatedMessage View Protocol
///
public protocol EquipmentAssociatedMessageView : class {
    func show(something:String)
}

///
/// EquipmentAssociatedMessage Presenter Protocol
///
public protocol EquipmentAssociatedMessageModule : class {
    func doSomething()
}

///
/// EquipmentAssociatedMessage Interactor Input Protocol
///
public protocol EquipmentAssociatedMessageInput : class {
    func get(something:String)
}

///
/// EquipmentAssociatedMessage Interactor Output Protocol
///
public protocol EquipmentAssociatedMessageOutput : class {
    func fetch(something:String)
}

///
/// EquipmentAssociatedMessage Router Protocol
///
public protocol EquipmentAssociatedMessageWireframe : class {
    func gotoSomeplace()
}
