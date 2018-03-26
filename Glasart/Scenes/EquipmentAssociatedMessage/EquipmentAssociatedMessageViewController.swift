//
//  EquipmentAssociatedMessageViewController.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentAssociatedMessageViewController: UIViewController {

    fileprivate var presenter : EquipmentAssociatedMessageModule?
    @IBOutlet weak var equipmentNameLabel: UILabel!
    @IBOutlet weak var equipmentDescLabel: UILabel!
    @IBOutlet weak var equipmentImage: UIImageView!
    
    var equipment:Equipment?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
        presenter?.getEquipment()
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:EquipmentAssociatedMessagePresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }
    
    @IBAction func confirmAssociation(_ sender: Any) {
        print("confirmado")
    }
    
    @IBAction func cancelAssociation(_ sender: Any) {
        print("cancelado")
    }
    
    func updateLabels() {
        let text = "\(equipment?.info?.width ?? 0) x \(equipment?.info?.height ?? 0)"
        equipmentNameLabel.text = text
        let text2 = "POTÊNCIA \(equipment?.info?.power ?? 0) W"
        equipmentDescLabel.text = text2
    }
    
    func updateEquipment() {
        let name = "vidro\(equipment?.info?.width ?? 0)"
        let image = UIImage(named: name)
        equipmentImage.image = image
    }
}

// MARK: - View Delegate
extension EquipmentAssociatedMessageViewController : EquipmentAssociatedMessageView {
    public func show(something: String) {
        //aaaa
    }
    
    public func show(equipment:Equipment?) {
        self.equipment = equipment
        updateLabels()
        updateEquipment()
    }
}
