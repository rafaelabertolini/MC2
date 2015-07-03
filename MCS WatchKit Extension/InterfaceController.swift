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
    
    @IBOutlet weak var handAnimation: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.handAnimation.setImageNamed("balanca")
        
        self.handAnimation.startAnimatingWithImagesInRange(NSMakeRange(0, 5), duration: 0.8, repeatCount: 1)

        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}