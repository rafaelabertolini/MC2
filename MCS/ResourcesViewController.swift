//
//  ResourcesViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 01/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

struct Recur {
    var name: String
}

class ResourcesViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var recurs: [Recur] = [
        Recur(name: "SENAD - www.senad.gov.br"),
        Recur(name: "Viva Voz - www.psicoativas.ufcspa.edu.br/vivavoz/"),
        Recur(name: "OBID - www.obid.senad.gov.br"),
        Recur(name: "Mundo Jovem - www.obid.senad.gov.br/portais/mundojovem"),
        Recur(name: "Jovem sem Tabaco - www.obid.senad.gov.br/portais/jovemsemtabaco"),
        Recur(name: "Ministério da Saúde - www.saude.gov.br"),
        Recur(name: "CAPS - www.saude.gov.br"),
        
        
    ]
    
    override func viewDidLoad() {
        
        tableView.backgroundColor = UIColor(red: 38/255, green: 87/255, blue: 83/255, alpha: 1.0)
        
        tableView.tableFooterView = UIView(frame:CGRectZero)
        
        
    }
    
    //MARK: Table View Data Source
    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return recurs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ResourcesTableViewCell
        
        cell.name.text = recurs[indexPath.row].name
        
        cell.backgroundColor = UIColor(red: 131/255, green: 186/255, blue: 184/255, alpha: 1.0)
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    
}
