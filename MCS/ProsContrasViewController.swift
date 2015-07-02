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
    
    var currentEntity = "Pro"
    
    @IBOutlet weak var prosOrConsSegmentedControl: UISegmentedControl!
    
    
    @IBAction func selectedProsOrCons(sender: UISegmentedControl) {
            
        switch prosOrConsSegmentedControl.selectedSegmentIndex{
            case 0:
                self.currentEntity = "Pro"
                tableView.reloadData()
            break;
            case 1:
                self.currentEntity = "Con"
                tableView.reloadData()
            break;
            default:
                self.currentEntity = "Pro"
                tableView.reloadData()
            break;
        }
    }
    
    @IBAction func addProsCons(sender: UIButton) {
        
        var alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
        
        let saveProAction = UIAlertAction(title: "Pró", style: .Default) {
            (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.savePro(textField.text)
            self.tableView.reloadData()
        }
        
        let saveConAction = UIAlertAction(title: "Contra", style: .Default) {
            (action: UIAlertAction!) -> Void in
            var textField = alert.textFields![0] as! UITextField
            self.saveCon(textField.text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) {
            (action: UIAlertAction!) -> Void in
        }
            
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
            
        alert.addAction(saveProAction)
        alert.addAction(saveConAction)
        alert.addAction(cancelAction)
            
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        
        tableView.estimatedRowHeight = 95
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
    }
    
    func savePro(note: String){
        
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Pro", inManagedObjectContext:    managedContext)
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
        
        let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchProsRequest = NSFetchRequest(entityName:"Pro")
        
        let fetchConsRequest = NSFetchRequest(entityName: "Con")
        
        var error: NSError?
        
        let fetchedConsResults = managedContext.executeFetchRequest(fetchConsRequest, error: &error)
        if let results = fetchedConsResults {
            cons = results as! Array<Con>
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        
        let fetchedProResults = managedContext.executeFetchRequest(fetchProsRequest, error: &error)
        if let resultsPro = fetchedProResults {
            pros = resultsPro as! Array<Pro>
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }

        
    }
    
    
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.currentEntity == "Pro"){
            return pros.count
        } else if(self.currentEntity == "Con"){
            return cons.count
        }
        return 0;
    }
    
    func tableView(tableView: UITableView,  cellForRowAtIndexPath  indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        
        let textAux = cell.viewWithTag(10) as? UILabel
        
        if(self.currentEntity == "Pro"){
            let pro = pros[indexPath.row]
            textAux!.text = pro.valueForKey("note") as! String?
        } else if(self.currentEntity == "Con") {
            let con = cons[indexPath.row]
            textAux!.text = con.valueForKey("note") as! String?
        }
        
        cell.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
        
        textAux!.textColor = UIColor(red: 50/255, green: 105/255, blue: 102/255, alpha: 1)
        
        textAux!.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
                
        return cell
    }

    
}