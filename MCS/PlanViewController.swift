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
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    @IBAction func pressSave(sender: UIButton){
    
        self.savePlan()
    
    }
    
    func savePlan(){
    
        
        if(mainObj != "" ){
        
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext!
        
            let entity = NSEntityDescription.entityForName("Plan", inManagedObjectContext: managedContext)
            let plan = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Plan
        
            plan.mainObj = mainObj.text
        
        }
        
        
    }
   
  
    
    
    @IBAction func pressActv1(sender: UIButton) {
        self.act1.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressActv2(sender: UIButton) {
        self.act2.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressActv3(sender: UIButton) {
        self.act3.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressActv4(sender: UIButton) {
        self.act4.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressActv5(sender: UIButton) {
        self.act5.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressActv6(sender: UIButton) {
        self.act6.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    
    
    @IBAction func pressSit1(sender: UIButton) {
        self.sit1.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }

    @IBAction func pressSit2(sender: UIButton) {
        self.sit2.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit3(sender: UIButton) {
        self.sit3.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit4(sender: UIButton) {
        self.sit4.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit5(sender: UIButton) {
        self.sit5.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit6(sender: UIButton) {
        self.sit6.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit7(sender: UIButton) {
        self.sit7.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit8(sender: UIButton) {
        self.sit8.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit9(sender: UIButton) {
        self.sit9.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
    @IBAction func pressSit10(sender: UIButton) {
        self.sit10.setImage(UIImage(named: "checkedbox"), forState: UIControlState.Normal)
    }
    
}
