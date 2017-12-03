//
//  TableViewCell.swift
//  RPL2students
//
//  Created by Gw on 03/12/17.
//  Copyright © 2017 FarrasDoko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

     @IBOutlet weak var id: UILabel!
    @IBOutlet weak var lbnama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
