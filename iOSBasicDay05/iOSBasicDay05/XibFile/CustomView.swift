//
//  CustomView.swift
//  iOSBasicDay05
//
//  Created by Hung Vuong on 4/8/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet private weak var labelText: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setTextLabel(_ name: String) {
        labelText.text = name
    }
    
    func getTextField() -> String {
        return textField.text ?? ""
    }
}


