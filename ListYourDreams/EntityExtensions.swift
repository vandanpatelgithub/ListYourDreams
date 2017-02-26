//
//  EntityExtensions.swift
//  ListYourDreams
//
//  Created by Preeti Patel on 24/02/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.createdAt = NSDate()
    }
}
