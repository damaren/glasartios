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
        
        guard let viewController = StoryboardIdentifier.deviceManager.storyboard?.instantiateViewController(withIdentifier: "NewDevicesListViewController") as? NewDevicesListViewController else {
            fatalError("Not able to find Storyboard for Device Manager")
        }

        let presenter = NewDevicesListPresenter()
        let router = NewDevicesListRouter()
        let interactor = NewDevicesListInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
    public func createNavigator() -> UINavigationController {
        let viewController = self.create()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
