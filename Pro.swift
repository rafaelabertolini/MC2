//
//  Pro.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 02/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import Foundation
import CoreData

@objc(Pro)

class Pro: NSManagedObject {

    @NSManaged var whatProblem: String
    @NSManaged var note: String

}
