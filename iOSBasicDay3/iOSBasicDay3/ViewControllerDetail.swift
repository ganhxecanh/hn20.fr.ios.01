//
//  ViewControllerDetail.swift
//  iOSBasicDay3
//
//  Created by Hung Vuong on 4/6/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {

    var fullName: String = ""
    var password: String = ""
    
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "Hello" + fullName + password
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
