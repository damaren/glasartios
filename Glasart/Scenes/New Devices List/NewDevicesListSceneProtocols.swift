//
//  NewDevicesListView.swift
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

///
/// NewDevicesList View Protocol
///
public protocol NewDevicesListView : class {
    func show(something:String)
}

///
/// NewDevicesList Presenter Protocol
///
public protocol NewDevicesListModule : class {
    func doSomething()
}

///
/// NewDevicesList Interactor Input Protocol
///
public protocol NewDevicesListInput : class {
    func get(something:String)
}

///
/// NewDevicesList Interactor Output Protocol
///
public protocol NewDevicesListOutput : class {
    func fetch(something:String)
}

///
/// NewDevicesList Router Protocol
///
public protocol NewDevicesListWireframe : class {
    func gotoSomeplace()
}
