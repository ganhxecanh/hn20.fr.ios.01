//
//  ViewControllerIndex.swift
//  iOSBasicDay3
//
//  Created by Hung Vuong on 4/6/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewControllerIndex: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerDetail") as! ViewControllerDetail
        vc.fullName = textName.text! // Đoạn này em test trước mà chưa biết bị lỗi gì nên chưa run đc push
        vc.password = textPass.text! // Đoạn này em test trước mà chưa biết bị lỗi gì nên chưa run đc push
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
