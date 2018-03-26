//
//  NewDevicesListConfigurator.swift
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class NewDevicesListConfigurator {
    
    public init() {}
    
    public func create() -> NewDevicesListViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "NewDevicesListViewController") as? NewDevicesListViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = NewDevicesListViewController()

        let presenter = NewDevicesListPresenter()
        let router = NewDevicesListRouter()
        let interactor = NewDevicesListInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
