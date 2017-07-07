//
//  ViewController.swift
//  KVOPlayer
//
//  Created by Scott Gardner on 7/5/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    let person = Person(firstName: "Scott", lastName: "Gardner")
    var personFirstNameObservation: NSKeyValueObservation?
    var personLastNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        observe()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController else { return }
        controller.person = person
    }
        
    func bind() {
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
    }
    
    func observe() {
        personFirstNameObservation = person.observe(\.firstName, options: [.old, .new]) { [unowned self] person, change in
            guard let old = change.oldValue,
                let new = change.newValue
                else { return }
            
            print("First name changed from \(old) to \(new)")
            self.firstNameLabel.text = new
            updateView()
        }
        
        personLastNameObservation = person.observe(\.lastName, options: [.old, .new]) { [unowned self] person, change in
            guard let old = change.oldValue,
                let new = change.newValue
                else { return }
            
            print("Last name changed from \(old) to \(new)")
            self.lastNameLabel.text = new
            updateView()
        }
        
        func updateView() {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
