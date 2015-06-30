//
//  ProblemaPreenchido.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 29/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class ProblemaPreenchido: UIViewController {
    
    @IBOutlet weak var introView: UIView!
    
    @IBOutlet weak var geralView: UIView!
    
    
    @IBOutlet weak var oQueLabel: UILabel!
    
    @IBOutlet weak var quantidadeLabel: UILabel!
    
    @IBOutlet weak var medidaDoQueLabel: UILabel!
    
    @IBOutlet weak var numVezesLabel: UILabel!
    
    @IBOutlet weak var medidaVezesLabel: UILabel!
    
    override func viewDidLoad() {
        geralView.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }
    
}
