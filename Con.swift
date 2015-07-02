//
//  Con.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 02/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import Foundation
import CoreData

@objc(Con)

class Con: NSManagedObject {

    @NSManaged var note: String
    @NSManaged var whatProblem: String

}
