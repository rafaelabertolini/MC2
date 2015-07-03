//
//  ProblemaPreenchido.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 29/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class ProblemaPreenchido: UIViewController {
    
    @IBOutlet weak var introView: UIView!
    
    @IBOutlet weak var geralView: UIView!
    
    
    @IBOutlet weak var oQueLabel: UILabel!
    
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    @IBOutlet weak var medidaDoQueLabel: UILabel!
    
    @IBOutlet weak var numVezesLabel: UILabel!
    
    @IBOutlet weak var medidaVezesLabel: UILabel!
    
    var dataSourceP = [Problem]()
    
    override func viewDidLoad() {
        geralView.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
        self.populaDados()
        self.preencheDados()
        
    }
    
    func populaDados(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        
        var err: NSErrorPointer = nil

        
        // Create the fetch request
        var fetchRequest = NSFetchRequest(entityName: "Problem")
        
        
        self.dataSourceP.removeAll()

        var problems: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        for index in 0..<problems.count{
            let problem = problems[index] as! Problem
            self.dataSourceP.append(problem)
        }
    }
    
    func preencheDados(){
        
        oQueLabel.text = self.dataSourceP[0].oque
        quantidadeLabel.text = self.dataSourceP[0].quanto.stringValue
        medidaDoQueLabel.text = self.dataSourceP[0].medidaqtd
        numVezesLabel.text = self.dataSourceP[0].frequencia
        medidaVezesLabel.text = self.dataSourceP[0].medidafreq
        
        
    }
    
}
