//
//  ReflectionsViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class ReflectionsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var notes = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
    }

    
    @IBAction func addReflection(sender: AnyObject) {
    
        var alert = UIAlertController(title: "Nova reflexão", message: "", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .Default) { (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.saveReflection(textField.text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) { (action: UIAlertAction!) -> Void in  }
        alert.addTextFieldWithConfigurationHandler {    (textField: UITextField!) -> Void in  }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
  
    }
    
    
    func saveReflection(note: String) {
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Reflection",    inManagedObjectContext:    managedContext)
        let reflection = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)

        reflection.setValue(note, forKey: "note")
    
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        notes.append(reflection)
    }
    
    
    //Fetch
    override func viewWillAppear(animated: Bool) {  super.viewWillAppear(animated)
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
   
        let fetchRequest = NSFetchRequest(entityName:"Reflection")

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
        
        cell.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
        cell.layer.cornerRadius = 15        
        
        return cell
    }
    

}
