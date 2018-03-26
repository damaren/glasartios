//
//  LoginConfigurator.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class LoginConfigurator {
    
    public init() {}
    
    public func create() -> LoginViewController {
        

        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            fatalError()
        }


        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
    public func createNavigation() -> UINavigationController {
        let viewController = create()
        let navigation = UINavigationController(rootViewController: viewController)
        return navigation
    }
    
}
