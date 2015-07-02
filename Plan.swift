//
//  Plan.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 01/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import Foundation
import CoreData

class Plan: NSManagedObject {

    @NSManaged var mainObj: String
    @NSManaged var actvAndSit: String
    @NSManaged var alternatives: String
    
}
