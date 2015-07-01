//
//  Problem.swift
//  MCS
//
//  Created by Karen Garcia dos Santos on 01/07/15.
//  Copyright (c) 2015 com.TBG. All rights reserved.
//

import Foundation
import CoreData

@objc(Problem)

class Problem: NSManagedObject {

    @NSManaged var frequencia: String
    @NSManaged var medidafreq: String
    @NSManaged var medidaqtd: String
    @NSManaged var oque: String
    @NSManaged var quanto: NSNumber

}
