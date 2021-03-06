//
//  ModelSelectionConfigurator.swift
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class ModelSelectionConfigurator {
    
    public init() {}
    
    public func create() -> ModelSelectionViewController {
        
        guard let viewController = StoryboardIdentifier.deviceManager.storyboard?.instantiateViewController(withIdentifier: "ModelSelectionViewController") as? ModelSelectionViewController else {
            fatalError()
        }

        let presenter = ModelSelectionPresenter()
        let router = ModelSelectionRouter()
        let interactor = ModelSelectionInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
