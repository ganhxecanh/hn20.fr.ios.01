//
//  SecondCell.swift
//  iOSBasic04
//
//  Created by Hung Vuong on 4/7/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {

    @IBOutlet weak var timeZone: UILabel!
    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
