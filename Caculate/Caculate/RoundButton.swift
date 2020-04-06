//
//  RoundButton.swift
//  Caculate
//
//  Created by Hung Vuong on 4/4/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit
@IBDesignable

class RoundButton: UIButton {
    @IBInspectable var roundButton:Bool = false {
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
