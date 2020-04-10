//
//  NameCell.swift
//  iOSBasicDay06
//
//  Created by Hung Vuong on 4/9/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: String) {
        nameText.text = data
    }
    
}
