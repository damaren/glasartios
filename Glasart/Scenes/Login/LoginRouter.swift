//
//  LoginRouter.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class LoginRouter {
    
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
extension LoginRouter : LoginWireframe {
    public func gotoSomeplace() {
        //Implement the route here
    }
    
    public func gotoRegister() {
        let destination = RegisterConfigurator().create()
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    
    public func gotoInsideApp() {
        DispatchQueue.main.async {
            guard let destination = try? NewDevicesListConfigurator().createNavigator() else { return }
            UIApplication.shared.keyWindow?.rootViewController = destination
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        }
    }
}
