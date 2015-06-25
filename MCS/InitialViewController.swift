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
    
    @IBOutlet weak var prosContrasView: UIView!
    
    @IBOutlet weak var planosView: UIView!
    
    
    @IBOutlet weak var metasView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.viewWithTag(01)?.backgroundColor = UIColor(red: 52, green: 105, blue: 102, alpha: 1)
        contentView.layer.cornerRadius = 35
        problemaView.layer.cornerRadius = 35
        prosContrasView.layer.cornerRadius = 35
        planosView.layer.cornerRadius = 35
        metasView.layer.cornerRadius = 35
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

