//
//  FirstCell.swift
//  iOSBasic04
//
//  Created by Hung Vuong on 4/7/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

protocol SwitchState : class {
    func changeSwitch(_ check : Int, state: Bool)
}

class FirstCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var switchState: UISwitch!
    
    var delegate : SwitchState?
    var check : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func delegateState(_ sender: UISwitch) {
        delegate?.changeSwitch(check!, state: switchState.isOn)
    }
}
