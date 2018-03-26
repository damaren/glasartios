//
//  NewDevicesListViewController.swift
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class NewDevicesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var presenter : NewDevicesListModule?
    var equipments:[Equipment] = [
    ]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
        NSLog("View Iniciada")
        presenter?.getEquipments()
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:NewDevicesListPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
        tableView.dataSource = self
        tableView.delegate = self
	}
    
    deinit {
        stopObservers()
    }
}

// MARK: - tableView data source
extension NewDevicesListViewController : UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipments.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "equipmentCell") as? NewEquipmentCell else {
            fatalError()
        }
        let equipment = equipments[indexPath.row]
        cell.selectionStyle = .none
        cell.equipment = equipment
        return cell
    }
    
}

// MARK: - TableView Delegate
extension NewDevicesListViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let equipment = equipments[indexPath.row]
        presenter?.gotoModelSelection(to: equipment)
    }
}

// MARK: - View Delegate
extension NewDevicesListViewController : NewDevicesListView {
    public func show(equipments:[Equipment]) {
        //Implement what to show here
        self.equipments = equipments
        NSLog("View - Apresentando equipamentos")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - Configurations
extension NewDevicesListViewController { 
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
