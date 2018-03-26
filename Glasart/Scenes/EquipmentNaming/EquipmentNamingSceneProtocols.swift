//
//  EquipmentNamingView.swift
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// EquipmentNaming View Protocol
///
public protocol EquipmentNamingView : class {
    func show(something:String)
    var isTextFieldHidden:Bool {get set}
    func showAssociatedEquipment()
}

///
/// EquipmentNaming Presenter Protocol
///
public protocol EquipmentNamingModule : class {
    func doSomething()
    func equipmentName(_ name:String)
    func registerName()
}

///
/// EquipmentNaming Interactor Input Protocol
///
public protocol EquipmentNamingInput : class {
    func get(something:String)
}

///
/// EquipmentNaming Interactor Output Protocol
///
public protocol EquipmentNamingOutput : class {
    func fetch(something:String)
}

///
/// EquipmentNaming Router Protocol
///
public protocol EquipmentNamingWireframe : class {
    func gotoSomeplace()
}
