//
//  ViewController.swift
//  iOSBasic05.2
//
//  Created by Hung Vuong on 4/10/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var totalTimeText: UITextField!
    @IBOutlet weak var buttonStart: UIButton!
    
    var timer = Timer()
    let shapeLayer = CAShapeLayer()
    var totalTime = 0
    var secondsPassed = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor // vien chay ngoai circle
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor // chỉnh màu circle bên trong
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))
    }
    
    fileprivate func extractedFunc() {
        guard let textField = totalTimeText.text else {
            return
        }
        guard let time = Int(textField) else {
            return
        }
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(time * 60)
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
        
    @IBAction func startButton(_ sender: UIButton) {
        extractedFunc()
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            
        }
    }
    
}


