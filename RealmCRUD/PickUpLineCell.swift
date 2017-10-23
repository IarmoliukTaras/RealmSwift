//
//  PickUpLineCell.swift
//  RealmCRUD
//
//  Created by 123 on 23.10.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit

class PickUpLineCell: UITableViewCell {


    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func configure(with pickUpLine: PickUpLine) {
        lineLabel.text = pickUpLine.line.capitalized
        scoreLabel.text = pickUpLine.scoreString()
        emailLabel.text = pickUpLine.email
    }
    
}
