//
//  ViewController.swift
//  Exercise03
//
//  Created by Hung Vuong on 4/2/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
//    Push screen B -> A: VC2 viewWillDisappear Called
//                        VC1 viewWillAppear Called
//                        VC1 viewDidAppear Called
//                        VC2 viewDidDisappear Called

//    Push screen A -> B: VC1 viewWillDisappear Called
//                        VC2 viewWillAppear Called
//                        VC2 viewDidAppear Called
//                        VC1 viewDidDisappear Called
    
// User tap button Home của iPhone đểcho app xuốngbackground rồi mở lại app: Không có method nào được gọi
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC1 viewDidLoad Called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC1 viewWillAppear Called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC1 viewDidAppear Called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC1 viewWillDisappear Called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC1 viewDidDisappear Called")
    }
    
    
}

