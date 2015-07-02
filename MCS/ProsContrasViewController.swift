//
//  prosContrasViewController.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class ProsContrasViewController: UIViewController, UITableViewDataSource {
    
    var pros = [Pro]()
    var cons = [Con]()
    
    @IBAction func addProsCons(sender: UIButton) {
        
        var alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
        
        let saveProAction = UIAlertAction(title: "Pró", style: .Default) { (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.savePro(textField.text)
            self.tableView.reloadData()
        }
        
        let saveConAction = UIAlertAction(title: "Contra", style: .Default) { (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.saveCon(textField.text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) { (action: UIAlertAction!) -> Void in  }
        alert.addTextFieldWithConfigurationHandler {    (textField: UITextField!) -> Void in  }
        alert.addAction(saveProAction)
        alert.addAction(saveConAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
    }
    
    func savePro(note: String){
        
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Pro",    inManagedObjectContext:    managedContext)
        let pro = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext) as! Pro
        
        pro.setValue(note, forKey: "note")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        pros.append(pro)
        
    }
    
    func saveCon(note: String){
        
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Con",    inManagedObjectContext:    managedContext)
        let con = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext) as! Con
        
        con.setValue(note, forKey: "note")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        cons.append(con)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
        //return notes.count
    }
    
    func tableView(tableView: UITableView,  cellForRowAtIndexPath  indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        //let reflection = notes[indexPath.row]
        //cell.textLabel!.text = reflection.valueForKey("note") as! String?
        return cell
    }
    
}