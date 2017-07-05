//
//  DetailViewController.swift
//  KVO Player
//
//  Created by Scott Gardner on 7/5/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var firstNameTextFieldObservation: NSKeyValueObservation?
    var lastNameTextFieldObservation: NSKeyValueObservation?
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        observe()
    }

    func bind() {
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
    }
    
    func observe() {
        firstNameTextFieldObservation = firstNameTextField.observe(\.text) { [weak self] textField, _ in
            guard let `self` = self else { return }
            self.person.firstName = textField.text ?? ""
        }
        
        lastNameTextFieldObservation = lastNameTextField.observe(\.text) { [weak self] textField, _ in
            guard let `self` = self else { return }
            self.person.lastName = textField.text ?? ""
        }
    }
}
