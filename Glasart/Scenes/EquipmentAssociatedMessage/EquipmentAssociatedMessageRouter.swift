//
//  EquipmentAssociatedMessageRouter.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentAssociatedMessageRouter {
    
    fileprivate weak var viewController : UIViewController?
    
    public init() {}
    
    public func inject(viewController:UIViewController?) {
        self.viewController = viewController
    }
    
    fileprivate func assertDependencies() {
        assert(viewController != nil, "ViewController was not set to the Router")
    }
    
    public func gotoInsideApplication() {
        assertDependencies()
    }
    
}

// MARK: - Wireframe Delegate
extension EquipmentAssociatedMessageRouter : EquipmentAssociatedMessageWireframe {
    public func gotoSomeplace() {
        //Implement the route here
    }
}
