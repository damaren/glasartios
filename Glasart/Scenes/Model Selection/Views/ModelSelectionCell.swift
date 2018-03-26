//
//  ModelSelectionCell.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

class ModelSelectionCell: UIView {

    var equipment:EquipmentInfo? = nil {
        didSet {
            update()
        }
    }
    
    @IBOutlet weak var modelTitleLabel: UILabel!
    
    @IBOutlet weak var modelDescriptionLabel: UILabel!
    
    func update() {
        let text = "\(equipment?.width ?? 0) x \(equipment?.height ?? 0)"
        modelTitleLabel.text = text
        let text2 = "POTÊNCIA \(equipment?.power ?? 0) W"
        modelDescriptionLabel.text = text2
    }
    
}
