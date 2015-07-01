
//
//  SettingsViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 01/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

struct Config {
    var title: String
    var desc: String
}

class SettingsViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var configs: [Config] = [
        Config(title: "Nome", desc: ""),
        Config(title: "Fazer Back-up", desc: ""),
        Config(title: "Notificações Push", desc: ""),
        Config(title: "Mudar senha", desc: "")
        
    ]
    
    override func viewDidLoad() {
        
        tableView.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
    }
    
    //MARK: Table View Data Source
    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return configs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SettingsTableViewCell
        
        cell.title.text = configs[indexPath.row].title
        
        cell.desc.text = configs[indexPath.row].desc
        
        cell.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
        cell.layer.cornerRadius = cell.layer.frame.height/2
        
        return cell
    }
    
    
}
