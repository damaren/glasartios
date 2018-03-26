//
//  ModelSelectionRouter.swift
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class ModelSelectionRouter {
    
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
extension ModelSelectionRouter : ModelSelectionWireframe {
    public func gotoSomeplace() {
        //Implement the route here
    }
}
