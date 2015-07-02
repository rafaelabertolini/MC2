//
//  PlanViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

struct Activity {
    var actv: String
}

struct Situation {
    var sit: String
}


class PlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var mainObj: UITextView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    
    var activities: [Activity] = [
    
        Activity(actv: "ola")
    
    ]
    
    
    var situations: [Situation] = [
        
        Situation(sit: "alo")
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView1.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        tableView1.tableFooterView = UIView(frame:CGRectZero)
        
        tableView2.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        tableView2.tableFooterView = UIView(frame:CGRectZero)
        
    }

   
    
    //MARK: Table View Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        if(tableView.tag == 5){
            return activities.count
        } else {
            return situations.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(tableView.tag == 5){
        
            var cell1 = tableView.dequeueReusableCellWithIdentifier("Cell1") as! ActivityTableViewCell
            cell1.actv.text = activities[indexPath.row].actv
            cell1.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
            
            
            return cell1
            
        } else {
        
            var cell2 = tableView.dequeueReusableCellWithIdentifier("Cell2") as! SituationTableViewCell
            cell2.sit.text = situations[indexPath.row].sit
            cell2.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
            
            return cell2
        }
        
    }

}
