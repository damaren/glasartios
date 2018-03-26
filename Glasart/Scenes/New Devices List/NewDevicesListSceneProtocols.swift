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
    func show(equipments:[Equipment])
}

///
/// NewDevicesList Presenter Protocol
///
public protocol NewDevicesListModule : class {
    func getEquipments()
    func gotoTeste()
    func gotoModelSelection(to equipment:Equipment)
}

///
/// NewDevicesList Interactor Input Protocol
///
public protocol NewDevicesListInput : class {
    func getEquipments()
}

///
/// NewDevicesList Interactor Output Protocol
///
public protocol NewDevicesListOutput : class {
    func fetch(equipments:[Equipment])
}

///
/// NewDevicesList Router Protocol
///
public protocol NewDevicesListWireframe : class {
    func gotoTeste()
    func gotoModelSelection(to equipment:Equipment)
}
