//
//  PlanoPreenchidoViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 03/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class PlanoPreenchidoViewController: ViewController {

    
    var notes1 = [ActvAndSit]()
    var notes2 = [Alternative]()
    var notes3 = [Plan]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    override func viewWillAppear(animated: Bool) {  super.viewWillAppear(animated)
        
        self.loadData()
    
    }
    
    
    func loadData() {
    
    
    
    
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest1 = NSFetchRequest(entityName:"ActvAndSit")
        let fetchRequest2 = NSFetchRequest(entityName:"Alternatives")
        let fetchRequest3 = NSFetchRequest(entityName:"Plan")

    
        var error: NSError?
        
//        let fetchedResults1 =  managedContext.executeFetchRequest(fetchRequest1,  error: &error) as! [NSManagedObject]?
//        let fetchedResults2 =  managedContext.executeFetchRequest(fetchRequest2,  error: &error) as! [NSManagedObject]?
//        let fetchedResults3 =  managedContext.executeFetchRequest(fetchRequest3,  error: &error) as! [NSManagedObject]?
        
        
        let fetchedResults1 = managedContext.executeFetchRequest(fetchRequest1, error: &error)
        if let results = fetchedResults1 {
            notes1 = results as! Array<ActvAndSit>
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        

        let fetchedResults2 = managedContext.executeFetchRequest(fetchRequest2, error: &error)
        if let results = fetchedResults2 {
            notes2 = results as! Array<Alternative>
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
    
        let fetchedResults3 = managedContext.executeFetchRequest(fetchRequest3, error: &error)
        if let results = fetchedResults3 {
            notes3 = results as! Array<Plan>
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        

    
    
    }

    
    
}
