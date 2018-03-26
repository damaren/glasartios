//
//  ModelSelectionViewController.swift
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class ModelSelectionViewController: UIViewController {

    fileprivate var presenter : ModelSelectionModule?
    private var equipmentsInfo:[EquipmentInfo] = []
    
    @IBOutlet weak var equipmentPicker: UIPickerView!
    @IBOutlet weak var equipmentImage: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
        equipmentsInfo = presenter?.equipmentsInfo ?? []
        equipmentPicker.reloadAllComponents()
        let singleEquipment = equipmentsInfo[0]
        updateEquipment(singleEquipment)
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:ModelSelectionPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
        equipmentPicker.dataSource = self
        equipmentPicker.delegate = self
	}
    
    deinit {
        stopObservers()
    }
    
    
}

// MARK: - View Delegate
extension ModelSelectionViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return equipmentsInfo.count
    }
    
//    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let singleEquipment = equipmentsInfo[row]
//        let text = "\(singleEquipment.width ?? 0) x \(singleEquipment.height ?? 0)"
//        return text
//    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let nib = UINib(nibName: String(describing:ModelSelectionCell.self), bundle: nil)
        guard let singleView = nib.instantiate(withOwner: nil, options: nil).first as? ModelSelectionCell else {
            fatalError()
        }
        let singleEquipment = equipmentsInfo[row]
        singleView.equipment = singleEquipment
        return singleView
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let singleEquipment = equipmentsInfo[row]
        updateEquipment(singleEquipment)
    }
    
    func updateEquipment(_ equipment:EquipmentInfo) {
        let name = "vidro\(equipment.width ?? 0)"
        let image = UIImage(named: name)
        equipmentImage.image = image
    }
}

// MARK: - View Delegate
extension ModelSelectionViewController : ModelSelectionView {
    public func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - Configurations
extension ModelSelectionViewController { 
    func startObservers() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func stopObservers() {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func showKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard show behavior here
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard hide behavior here
        }
    }
}
