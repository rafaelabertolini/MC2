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

class SettingsViewController: UITableViewController, UITableViewDataSource {

    var configs: [Config] = [
        Config(title: "Nome", desc: ""),
        Config(title: "Fazer Back-up", desc: ""),
        Config(title: "Notificações Push", desc: ""),
        Config(title: "Mudar senha", desc: "")

    ]
    
    override func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return configs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SettingsTableViewCell
            
            cell.title.text = configs[indexPath.row].title
            cell.desc.text = configs[indexPath.row].desc
            
            return cell
    }


}
