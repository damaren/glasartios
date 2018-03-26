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
        
        guard let viewController = StoryboardIdentifier.deviceManager.storyboard?.instantiateViewController(withIdentifier: "EquipmentAssociatedMessageViewController") as? EquipmentAssociatedMessageViewController else {
            fatalError()
        }

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
