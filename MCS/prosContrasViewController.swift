//
//  prosContrasViewController.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ProsContrasViewController: UIViewController, UITableViewDataSource {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
        
        println(self.navigationController)
        
//        self.navigationController?.setNavigationBarHidden = false
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