//
//  EquipmentNamingViewController.swift
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentNamingViewController: UIViewController {

    fileprivate var presenter : EquipmentNamingModule?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var associatedNameTextField: UILabel!
    @IBOutlet weak var associatedNameView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
    public var isTextFieldHidden:Bool = true {
        didSet {
            if isTextFieldHidden != oldValue {
                nameTextField.backgroundColor = UIColor.clear
                if isTextFieldHidden == false {
                    nameTextField.backgroundColor = self.view.backgroundColor
                }
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:EquipmentNamingPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
        nameTextField.delegate = self
        nameTextField.backgroundColor = UIColor.clear
	}
    
    deinit {
        stopObservers()
    }
    
    @IBAction func confimName(_ sender: Any) {
        presenter?.registerName()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
}

// MARK: - View Delegate
extension EquipmentNamingViewController : EquipmentNamingView {
    public func showAssociatedEquipment() {
        self.becomeFirstResponder()
        middleView.bringSubview(toFront: associatedNameView)
    }
    public func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - View Delegate
extension EquipmentNamingViewController : UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        presenter?.equipmentName(text)
        return true
    }
}

// MARK: - Configurations
extension EquipmentNamingViewController { 
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
            let offset:CGFloat = 50.0
            let frameHeight = finalFrame.height - offset
            
            // Implement keyboard show behavior here
            topConstraint.constant = -frameHeight
            bottomConstraint.constant = frameHeight
            view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard hide behavior here
            topConstraint.constant = 0.0
            bottomConstraint.constant = 0.0
            view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.view.layoutIfNeeded()
            })
        }
    }
}
