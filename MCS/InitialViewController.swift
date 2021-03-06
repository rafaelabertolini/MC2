//
//  InitialViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 23/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit
import CoreData

class InitialViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var problemaView: UIView!
    @IBOutlet weak var problemaButton: UIButton!
    
    @IBOutlet weak var prosContrasView: UIView!
    @IBOutlet weak var prosContrasButton: UIButton!
    
    @IBOutlet weak var planosView: UIView!
    @IBOutlet weak var planosButton: UIButton!
    
    @IBOutlet weak var metasView: UIView!
    @IBOutlet weak var metasButton: UIButton!
    
    
    @IBOutlet weak var stepTwoImageView: UIImageView!
    
    @IBOutlet weak var stepThreeImageView: UIImageView!
    
    @IBOutlet weak var stepFourImageView: UIImageView!
    
    
    
    var dataSourceP = [Problem]()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        if(testarDados("Problem")){
            self.stepTwoImageView.image = UIImage(named: "ProsContras")
        } else {
            self.stepTwoImageView.image = UIImage(named: "ProsContrasBloqueado")
        }
        
        if(testarDados("Pro") || testarDados("Con")){
            self.stepThreeImageView.image = UIImage(named: "Plano")
        } else {
            self.stepThreeImageView.image = UIImage(named: "SeuplanoBloqueado")
        }
        
        if(testarDados("Plan")){
            self.stepFourImageView.image = UIImage(named: "Meta")
        } else {
            self.stepFourImageView.image = UIImage(named: "MetasBloqueado-1")
        }
        
    }
    
    @IBAction func problemaAction(sender: UIButton) {
        if(testarDados("Problem")){
            performSegueWithIdentifier("problema", sender: self)
        } else {
            performSegueWithIdentifier("problemaNil", sender: self)
        }
    }
    
    @IBAction func prosContrasAction(sender: UIButton) {
        if(testarDados("Problem")){
            performSegueWithIdentifier("prosContrasSegue", sender: self)
        } else {
            pressionarView()
        }
    }
    
    
    @IBAction func planosAction(sender: UIButton) {
        
        if(testarDados("Pro") || testarDados("Con")){
           performSegueWithIdentifier("planoSegue", sender: self)
            } else {
            pressionarView()
        }
    }
    
    @IBAction func metasAction(sender: UIButton) {
         if(testarDados("Plan")){
            performSegueWithIdentifier("metasSegue", sender: self)
        } else {
            pressionarView()
        }
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.viewWithTag(01)?.backgroundColor = UIColor(red: 52, green: 105, blue: 102, alpha: 1)
        contentView.layer.cornerRadius = 10
        problemaView.layer.cornerRadius = 35
        prosContrasView.layer.cornerRadius = 35
        planosView.layer.cornerRadius = 35
        metasView.layer.cornerRadius = 35
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func testarDados(entidade: String) -> Bool{
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        
        var err: NSErrorPointer = nil
        
        
        // Create the fetch request
        var fetchRequest = NSFetchRequest(entityName: entidade)
        
        
        var arrayDados: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        /*for index in 0..<arrayDados.count{
            if(entidade == "Problem"){
               let dado = arrayDados[index] as! Problem
            }
            
            //dados.append(dado)
        }*/
        
        if(arrayDados.count > 0){
            print("Tem Algo")
            return true;
        } else {
            print("Não tem")
            return false;
        }
    }
    
    func varrerCoreData(){
            
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
        
        if(self.dataSourceP.count > 0){
           performSegueWithIdentifier("problema", sender: self)
        } else {
            performSegueWithIdentifier("problemaNil", sender: self)
        }
        
    }
    
    func pressionarView(){
        let tapAlert = UIAlertController(title: "Não Liberado", message: "Por favor siga as etapas em ordem.", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

