//
//  InterfaceController.swift
//  MCS WatchKit Extension
//
//  Created by Karen Garcia dos Santos on 02/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var nomeLabel: WKInterfaceLabel!
    
    @IBOutlet weak var handAnimation: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.handAnimation.setImageNamed("balanca")
        
        self.handAnimation.startAnimatingWithImagesInRange(NSMakeRange(0, 17), duration: 1, repeatCount: 3)

        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var request = ["request": "getNome"]
        WKInterfaceController.openParentApplication(request, reply:{(replyFromParent, error) -> Void in
            if error != nil{
                println("tem um erro")
            }
            else{
                println("passou")
                println(replyFromParent)
                self.nomeLabel.setText(replyFromParent["replay"]as? String)
            }
            
            
            
        })

        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
