//
//  ItemCell.swift
//  ListYourDreams
//
//  Created by Preeti Patel on 25/02/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item) {
        title.text = item.title
        cost.text = "$\(item.cost)"
        details.text = item.details
    }
}
