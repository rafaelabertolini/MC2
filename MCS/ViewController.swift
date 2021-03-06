//
//  ViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 25/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //let userDefaults = NSUserDefaults.standardUserDefaults()
        
        //println("ass")
        //!userDefaults.boolForKey("walkthroughPresented")
        if  NSUserDefaults.standardUserDefaults().stringForKey("name") != nil{
            
            performSegueWithIdentifier("tutorialSegue", sender: self)
            
            //println("dess")
            //showWalkthrough()
            
            //NSUserDefaults.standardUserDefaults().setBool(true, forKey: "walkthroughPresented")
            //NSUserDefaults.standardUserDefaults().synchronize()
        } 
        //println("assss")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//    @IBAction func loadDataClicked(sender: AnyObject) {
//        
//        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        
//        if let nameIsNotNill = defaults.objectForKey("name") as? String {
//            self.nameField.text = defaults.objectForKey("name") as! String
//        }
//        
//    }

    
    
    // walkthrough call
    @IBAction func showWalkthrough(){
        
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthrough = stb.instantiateViewControllerWithIdentifier("walk") as! BWWalkthroughViewController
        let page_zero = stb.instantiateViewControllerWithIdentifier("walk0") as! UIViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("walk1") as! UIViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("walk2")as! UIViewController
        let page_three = stb.instantiateViewControllerWithIdentifier("walk3") as! UIViewController
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        walkthrough.addViewController(page_three)
        walkthrough.addViewController(page_zero)
        
        self.presentViewController(walkthrough, animated: true, completion: nil)
    
    }
    
    
    // save userDefaults
    @IBAction func saveDataClicked(sender: AnyObject) {
        
        var defaults: NSUserDefaults = NSUserDefaults()
        
        defaults.setObject(self.nameField.text, forKey: "name")
        
        defaults.synchronize()
        
    }
    
    
    // MARK: - Walkthrough delegate -
    
    func walkthroughPageDidChange(pageNumber: Int) {
        println("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "tutorialSegue"){
        }
    }
    
    
    
    
}
