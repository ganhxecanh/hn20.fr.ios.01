//
//  ViewController.swift
//  Caculate
//
//  Created by Hung Vuong on 4/4/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    enum Operation: String {
        case Add = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multiply = "*"
        case NULL = "Null"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var upButton: [UIButton]!
    @IBOutlet var rightButton: [UIButton]!
    
    var runningNumber: String = ""
    var leftValue: String = ""
    var rightValue: String = ""
    var result: String = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = "0"
    }
    
    @IBAction func chillColor(_ sender: RoundButton) {
        for button in upButton {
            button.backgroundColor = .systemGreen
        }
        
        for button in rightButton {
            button.backgroundColor = .blue
        }
    }
    
    @IBAction func defaultColor(_ sender: RoundButton) {
        for button in upButton {
            button.backgroundColor = .lightGray
        }
        
        for button in rightButton {
            button.backgroundColor = .systemOrange
        }
    }
    
    @IBAction func convenienceColor(_ sender: RoundButton) {
        for button in upButton {
            button.backgroundColor = .yellow
        }
        
        for button in rightButton {
            button.backgroundColor = .orange
        }
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag - 1)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    
    @IBAction func button(_ sender: RoundButton) {
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                guard let leftValue1 = Double(leftValue) else {
                    result = "Error"
                    return
                }
                guard let rightValue1 = Double(rightValue) else {
                    result = "Error"
                    return
                }
                if currentOperation == .Add {
                    result = "\(leftValue1 + rightValue1)"
                } else if currentOperation == .Subtract {
                    result = "\(leftValue1 - rightValue1)"
                } else if currentOperation == .Multiply {
                    result = "\(leftValue1 * rightValue1)"
                } else if currentOperation == .Divide {
                    result = "\(leftValue1 / rightValue1)"
                }
                leftValue = result
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

