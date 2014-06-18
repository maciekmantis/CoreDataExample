//
//  ViewController.swift
//  CoreDataExample2
//
//  Created by Maciek on 18.06.2014.
//  Copyright (c) 2014 Maciek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let usernameField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    let saveButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let loadButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControls()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configureControls() {
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(saveButton)
        self.view.addSubview(loadButton)
        self.usernameField.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.passwordField.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.saveButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.loadButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.saveButton.setTitle("Save", forState: UIControlState.Normal)
        self.saveButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.saveButton.sizeToFit()
        var topSaveButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[saveButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["saveButton": saveButton])
        var trailingSaveButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[saveButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["saveButton": saveButton])
        self.view.addConstraints(topSaveButtonConstraints)
        self.view.addConstraints(trailingSaveButtonConstraints)
        
        self.loadButton.setTitle("Load", forState: UIControlState.Normal)
        self.loadButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.loadButton.sizeToFit()
        var topLoadButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[loadButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["loadButton": loadButton])
        var trailingLoadButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(>=100)-[loadButton(<=100)]-20-|", options: nil, metrics: nil, views: ["loadButton": loadButton])
        self.view.addConstraints(topLoadButtonConstraints)
        self.view.addConstraints(trailingLoadButtonConstraints)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

