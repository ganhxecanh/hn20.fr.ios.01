//
//  ViewController.swift
//  iOSBasicDay05
//
//  Created by Hung Vuong on 4/8/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: CustomView!
    @IBOutlet weak var email: CustomView!
    @IBOutlet weak var phoneNumber: CustomView!
    @IBOutlet weak var address: CustomView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var validateText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.setTextLabel("Họ tên")
        email.setTextLabel("Email")
        phoneNumber.setTextLabel("SĐT")
        address.setTextLabel("Địa chỉ")
        validateText.text = ""
    }
    
    @IBAction func showGender(_ sender: UIButton) {
        let alertGender = UIAlertController(title: "Chọn giới tính", message: "Colored options exists", preferredStyle: .actionSheet)
        let maleAction = UIAlertAction(title: "Nam", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            sender.titleLabel?.text = "Nam"
        })
        
        let femaleAction = UIAlertAction(title: "Nữ", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            sender.titleLabel?.text = "Nữ"
        })
        
        let unknownAction = UIAlertAction(title: "Unknown", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            sender.titleLabel?.text = "Unknown"
        })
        alertGender.addAction(maleAction)
        alertGender.addAction(femaleAction)
        alertGender.addAction(unknownAction)
        self.present(alertGender, animated: true, completion: nil)
    }
    
    func validateTextNumber(text: String) -> Bool {
        return text.isNumeric
    }
    
    func validEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func showDialog() {
        guard let description = descriptionText.text else { return }
        guard let gender = genderButton.titleLabel?.text else { return }
        let message = "\n Họ tên: \(name.getTextField())" + "\n Email: \(email.getTextField())" + "\n Phone Number: \(phoneNumber.getTextField())" + "\n Address: \(address.getTextField())" + "\n Mô tả: \(description)" + "\n Giới tính: \(gender)"
        let alert = UIAlertController(title: "Confirm", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đăng ký", style: .default, handler: { (_) in
            self.showDialog1(message: "Welcome")
        }))
        self.present(alert, animated: true)
    }
    
    func showDialog1(message: String) {
        let alertViewController: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (_) in
        }
        alertViewController.addAction(action)
        alertViewController.modalPresentationStyle = .overFullScreen
        present(alertViewController, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: UIButton) {
        if validEmail(email: email.getTextField()) == false {
            validateText.text = "Invalid email !!"
        } else if validateTextNumber(text: phoneNumber.getTextField()) == false {
            validateText.text = "Invalid phone number !!"
        } else {
            showDialog()
        }
    }
}

extension String {
    var isNumeric: Bool {
        if self.isEmpty {
            return false
        }
        let nums: Set<Character> =  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}





