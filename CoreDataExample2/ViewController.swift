//
//  ViewController.swift
//  CoreDataExample2
//
//  Created by Maciek on 18.06.2014.
//  Copyright (c) 2014 Maciek. All rights reserved.
//

import UIKit
import CoreData

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
    
    func save() {
        println("save()")
        var appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("" + self.usernameField.text, forKey: "username")
        newUser.setValue("" + self.passwordField.text, forKey: "password")
        
        context.save(nil)
        println(newUser)
    }
    
    func load() {
        println("load()")
        var appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDelegate.managedObjectContext

        var request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "" + self.usernameField.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0) {
            var res = results[0] as NSManagedObject
            self.usernameField.text = res.valueForKey("username") as String
            self.passwordField.text = res.valueForKey("password") as String
        } else {
            println("0 results")
        }
        
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
        
//        var topUsernameFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[usernameField]-(>=100)-|", options: nil, metrics: nil, views: ["usernameField": usernameField])
        var trailingUsernameFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[usernameField]-10-|", options: nil, metrics: nil, views: ["usernameField": usernameField])
//        self.view.addConstraints(topUsernameFieldConstraints)
        self.view.addConstraints(trailingUsernameFieldConstraints)
        self.usernameField.borderStyle = UITextBorderStyle.RoundedRect
        
        var topPasswordFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[usernameField]-20-[passwordField]-(>=100)-|", options: nil, metrics: nil, views: ["usernameField": usernameField, "passwordField": passwordField])
        var trailingPasswordFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[passwordField]-10-|", options: nil, metrics: nil, views: ["passwordField": passwordField])
        self.view.addConstraints(topPasswordFieldConstraints)
        self.view.addConstraints(trailingPasswordFieldConstraints)
        self.passwordField.borderStyle = UITextBorderStyle.RoundedRect

        
        self.saveButton.setTitle("Save", forState: UIControlState.Normal)
        self.saveButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.saveButton.sizeToFit()
        var topSaveButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[saveButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["saveButton": saveButton])
        var trailingSaveButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[saveButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["saveButton": saveButton])
        self.view.addConstraints(topSaveButtonConstraints)
        self.view.addConstraints(trailingSaveButtonConstraints)
        self.saveButton.addTarget(self, action: "save", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.loadButton.setTitle("Load", forState: UIControlState.Normal)
        self.loadButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.loadButton.sizeToFit()
        var topLoadButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[loadButton(<=100)]-(>=100)-|", options: nil, metrics: nil, views: ["loadButton": loadButton])
        var trailingLoadButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(>=100)-[loadButton(<=100)]-20-|", options: nil, metrics: nil, views: ["loadButton": loadButton])
        self.view.addConstraints(topLoadButtonConstraints)
        self.view.addConstraints(trailingLoadButtonConstraints)
        self.loadButton.addTarget(self, action: "load", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

