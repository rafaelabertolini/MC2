//
//  ProblemaViewController.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 26/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ProblemaViewController: UIViewController {
    
    @IBOutlet weak var oQueView: UIView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
        oQueView.layer.cornerRadius = 25
    }

}
