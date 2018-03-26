//
//  NewDevicesListRouter.swift
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class NewDevicesListRouter {
    
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
extension NewDevicesListRouter : NewDevicesListWireframe {
    public func gotoTeste() {
        //Implement the route here
        let testeScreen = testeConfigurator().create()
        //viewController?.present(testeScreen, animated: true, completion: nil)
        viewController?.navigationController?.pushViewController(testeScreen, animated: true)
    }
    
    public func gotoModelSelection(to equipment:Equipment) {
        //Implement the route here
        let destination = ModelSelectionConfigurator().create()
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    
}
