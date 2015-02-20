//
//  PlanViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData


class PlanViewController: UIViewController {

    
    
    @IBOutlet weak var mainObj: UITextView!
    
    @IBOutlet weak var introLabel: UILabel!
    
    @IBOutlet weak var secondIntroLabel: UILabel!
    
    
    @IBOutlet weak var act1: UIButton!
    @IBOutlet weak var actvL1: UILabel!
    
    @IBOutlet weak var act2: UIButton!
    @IBOutlet weak var actvL2: UILabel!
    
    @IBOutlet weak var act3: UIButton!
    @IBOutlet weak var actvL3: UILabel!
    
    @IBOutlet weak var act4: UIButton!
    @IBOutlet weak var actvL4: UILabel!
    
    @IBOutlet weak var act5: UIButton!
    @IBOutlet weak var actvL5: UILabel!
    
    @IBOutlet weak var act6: UIButton!
    @IBOutlet weak var actvL6: UILabel!
    
    @IBOutlet weak var sit1: UIButton!
    @IBOutlet weak var sitL1: UILabel!
    
    @IBOutlet weak var sit2: UIButton!
    @IBOutlet weak var sitL2: UILabel!
    
    @IBOutlet weak var sit3: UIButton!
    @IBOutlet weak var sitL3: UILabel!
    
    @IBOutlet weak var sit4: UIButton!
    @IBOutlet weak var sitL4: UILabel!
    
    @IBOutlet weak var sit5: UIButton!
    @IBOutlet weak var sitL5: UILabel!
    
    @IBOutlet weak var sit6: UIButton!
    @IBOutlet weak var sitL6: UILabel!
    
    @IBOutlet weak var sit7: UIButton!
    @IBOutlet weak var sitL7: UILabel!
    
    @IBOutlet weak var sit8: UIButton!
    @IBOutlet weak var sitL8: UILabel!
    
    @IBOutlet weak var sit9: UIButton!
    @IBOutlet weak var sitL9: UILabel!
    
    @IBOutlet weak var sit10: UIButton!
    @IBOutlet weak var sitL10: UILabel!
    
    @IBOutlet weak var salvarButton: UIButton!
    
    @IBAction func salvarButtonAction(sender: UIButton) {
        self.savePlan()
        self.selectionsAndAdds()
    }
    
    
    var activities = [NSManagedObject]()
    var alternatives = [NSManagedObject]()
    var actvsAndSits = [String]()
    var alters = [String]()
    var name: String!
    
    var droga: String!
    var dataSourceP = [Problem]()

    @IBOutlet weak var alterTextView: UITextView!

    
    
    override func viewDidLoad() {
      
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
        super.viewDidLoad()
        self.populaDados()
        self.introLabel.text = "Eu uso \(self.droga) quando: "
        self.secondIntroLabel.text = "Nas seguintes situações: "
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }
    
    
    func DismissKeyboard(){
        
        view.endEditing(true)
        
    }
    
    func populaDados(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        
        var err: NSErrorPointer = nil
        
        
        // Create the fetch request
        var fetchRequest = NSFetchRequest(entityName: "Problem")
        
        
        self.dataSourceP.removeAll()
        
        var problems: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        for index in 0..<problems.count{
            let problem = problems[index] as! Problem
            self.dataSourceP.append(problem)
        }
        if(self.dataSourceP.count > 0){
            droga = self.dataSourceP[0].oque
        }
    }

   
    @IBAction func pressSave(sender: UIButton){
        
        self.savePlan()
        self.selectionsAndAdds()
        
    
    }
    
    
    func selectionsAndAdds() {
    
        for var index=0; index < actvsAndSits.count ; index++ {
            
          name = actvsAndSits[index]
          self.saveActvAndSit(name)
            
        }
        
        for var index=0; index < alters.count ; index++ {
            
            name = alters[index]
            self.saveAlternative(name)
            
        }
        

    }
    
    
    @IBAction func addAlternative(sender: AnyObject) {
        
        alters.append(alterTextView.text)
    
    }
    
  
    
    func saveActvAndSit(name: String){

        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("ActvAndSit", inManagedObjectContext:    managedContext)
        let actvAndSit = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext) as! ActvAndSit
        
        actvAndSit.setValue(name, forKey: "note")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        activities.append(actvAndSit)
      
    }
    
    
    func saveAlternative(note: String){
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Alternative",    inManagedObjectContext:    managedContext)
        let alternative = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext) as! Alternative
        
        alternative.setValue(note, forKey: "note")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        alternatives.append(alternative)
    
    }

    
    
    func savePlan(){
        
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
        
            let entity = NSEntityDescription.entityForName("Plan", inManagedObjectContext: managedContext)
            let plan = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Plan
        
            plan.mainObj = mainObj.text
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
    }
   
    
    
    //Activities
    @IBAction func pressActv1(sender: UIButton) {
        self.act1.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL1.text!)
    }
    
    @IBAction func pressActv2(sender: UIButton) {
        self.act2.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL2.text!)
    }
    
    @IBAction func pressActv3(sender: UIButton) {
        self.act3.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL3.text!)
    }
    
    @IBAction func pressActv4(sender: UIButton) {
        self.act4.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL1.text!)
    }
    
    @IBAction func pressActv5(sender: UIButton) {
        self.act5.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL5.text!)
    }
    
    @IBAction func pressActv6(sender: UIButton) {
        self.act6.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(actvL6.text!)
    }
    
    
    
    //Situations
    @IBAction func pressSit1(sender: UIButton) {
        self.sit1.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL1.text!)
    }

    @IBAction func pressSit2(sender: UIButton) {
        self.sit2.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL2.text!)
    }
    
    @IBAction func pressSit3(sender: UIButton) {
        self.sit3.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL3.text!)
    }
    
    @IBAction func pressSit4(sender: UIButton) {
        self.sit4.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL4.text!)
    }
    
    @IBAction func pressSit5(sender: UIButton) {
        self.sit5.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL5.text!)
    }
    
    @IBAction func pressSit6(sender: UIButton) {
        self.sit6.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL6.text!)
    }
    
    @IBAction func pressSit7(sender: UIButton) {
        self.sit7.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL7.text!)
    }
    
    @IBAction func pressSit8(sender: UIButton) {
        self.sit8.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL8.text!)
    }
    
    @IBAction func pressSit9(sender: UIButton) {
        self.sit9.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL9.text!)
    }
    
    @IBAction func pressSit10(sender: UIButton) {
        self.sit10.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
        actvsAndSits.append(sitL10.text!)
    }
    
    
    
    //Alternatives
    
    
    
}
