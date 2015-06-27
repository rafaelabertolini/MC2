//
//  InitialViewController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 23/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

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
    
    @IBAction func problemaAction(sender: UIButton) {
        pressionarView()
    }
    
    @IBAction func prosContrasAction(sender: UIButton) {
        pressionarView()
    }
    
    
    @IBAction func planosAction(sender: UIButton) {
        pressionarView()
    }
    
    @IBAction func metasAction(sender: UIButton) {
        pressionarView()
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
    
    func pressionarView(){
        let tapAlert = UIAlertController(title: "Tapped", message: "You just tapped the tap view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

