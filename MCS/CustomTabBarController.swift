//
//  CustomTabBarController.swift
//  MCS
//
//  Created by Rafaela dos Santos Bertolini on 25/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var tintColor = (UIApplication.sharedApplication().delegate as! AppDelegate).selectedTintColor
    var selectedTintColor = (UIApplication.sharedApplication().delegate as! AppDelegate).tintColor
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var tabBar = self.tabBar
        for index in 0..<tabBar.items!.count {
            var item = tabBar.items![index] as! UITabBarItem
            item.image = item.selectedImage.imageWithColor(tintColor).imageWithRenderingMode(.AlwaysOriginal)
            item.setTitleTextAttributes(NSDictionary(object: tintColor, forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject],
                forState: UIControlState.Normal)
            item.setTitleTextAttributes(NSDictionary(object: selectedTintColor, forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject],
                forState: UIControlState.Selected)
            //item.setTitleTextAttributes( NSDictionary(objectsAndKeys: [tintColor, NSForegroundColorAttributeName]) as [NSObject : AnyObject], forState: UIControlState.Selected)
        }
        
    }

   
}
