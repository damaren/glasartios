//
//  EquipmentAssociatedMessageConfigurator.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentAssociatedMessageConfigurator {
    
    public init() {}
    
    public func create() -> EquipmentAssociatedMessageViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "EquipmentAssociatedMessageViewController") as? EquipmentAssociatedMessageViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = EquipmentAssociatedMessageViewController()

        let presenter = EquipmentAssociatedMessagePresenter()
        let router = EquipmentAssociatedMessageRouter()
        let interactor = EquipmentAssociatedMessageInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
