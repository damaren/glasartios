//
//  NewEquipmentCell.swift
//  Glasart
//
//  Created by Damaren on 15/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

class NewEquipmentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var equipmentImage: UIImageView!
    
    var equipment:Equipment? = nil {
        didSet {
            update()
        }
    }
    
    func update() {
        nameLabel.text = equipment?.name
        descLabel.text = equipment?.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
