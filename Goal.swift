//
//  Goal.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 30/06/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import Foundation
import CoreData

class Goal: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var note: String

}
