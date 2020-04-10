//
//  TabBarView.swift
//  iOSBasicDay06
//
//  Created by Hung Vuong on 4/9/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

protocol ButtonTapDelegate {
    func tapButton(tag: Int)
}

class TabBarView: UIView {
    
    @IBOutlet weak var leftView: UIButton!
    @IBOutlet weak var centerView: UIButton!
    @IBOutlet weak var rightView: UIButton!
    @IBOutlet var contentView: UIStackView!
    var delegate: ButtonTapDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @IBAction func leftButtonTap(_ sender: UIButton) {
        delegate?.tapButton(tag: 1)
        print("1")
    }
    
    
    @IBAction func centerButtonTap(_ sender: UIButton) {
        delegate?.tapButton(tag: 2)
        print("2")
    }
    
    
    @IBAction func rightButtonTap(_ sender: UIButton) {
        delegate?.tapButton(tag: 3)
        print("3")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
