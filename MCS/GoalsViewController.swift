//
//  GoalsViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class GoalsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var notes = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Goals"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    
    @IBAction func addGoal(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Nova meta", message: "", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .Default) { (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.saveGoal(textField.text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) { (action: UIAlertAction!) -> Void in  }
        alert.addTextFieldWithConfigurationHandler {    (textField: UITextField!) -> Void in  }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func saveGoal(note: String) {
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Goal",    inManagedObjectContext:    managedContext)
        let goal = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        goal.setValue(note, forKey: "note")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        notes.append(goal)
    }
    
    
    //Fetch
    override func viewWillAppear(animated: Bool) {  super.viewWillAppear(animated)
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Goal")
        
        var error: NSError?
        let fetchedResults =    managedContext.executeFetchRequest(fetchRequest,    error: &error) as! [NSManagedObject]?
        if let results = fetchedResults {
            notes = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(tableView: UITableView,  cellForRowAtIndexPath  indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        let reflection = notes[indexPath.row]
        cell.textLabel!.text = reflection.valueForKey("note") as! String?
        return cell
    }
    
}
