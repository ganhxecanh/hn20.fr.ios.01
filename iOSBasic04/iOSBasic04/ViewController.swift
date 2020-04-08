//
//  ViewController.swift
//  iOSBasic04
//
//  Created by Hung Vuong on 4/7/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var tableViewArray : Array<String> = ["24-Hour Time", "Set Automatically", "Time Zone", "Ha Noi"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Date & Time"
        self.datePicker.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "1")
        tableView.register(UINib.init(nibName: "SecondCell", bundle: nil), forCellReuseIdentifier: "2")
        tableView.register(UINib.init(nibName: "ThirdCell", bundle: nil), forCellReuseIdentifier: "3")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as? FirstCell else {
                return UITableViewCell()
            }
            if indexPath.section == 0 {
                cell.textLabel?.text = tableViewArray[0]
                cell.check = 0
                cell.delegate = self 
            } else {
                cell.textLabel?.text = tableViewArray[1]
                cell.check = 1
                cell.delegate = self
            }
            return cell
        } else if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "2", for: indexPath) as? SecondCell else {
                return UITableViewCell()
            }
            cell.timeZone.text = tableViewArray[2]
            cell.cityName.text = tableViewArray[3]
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "3", for: indexPath) as? ThirdCell else {
                return UITableViewCell()
            }
            cell.isHidden = true
            cell.tag = 500
            return cell
        }
    }
}

extension ViewController : SwitchState {
    func changeSwitch(_ check: Int, state: Bool) {
        if check == 0{
            if state{
                print("24 hour on")
            }else{
                print("24 hour off")
            }
        }else{
            if state{
                print("auto on")
                self.datePicker.isHidden = true
                self.tableView.viewWithTag(500)?.isHidden = true
                
            }else{
                print("auto off")
                self.datePicker.isHidden = false
                self.tableView.viewWithTag(500)?.isHidden = false
            }
        }
    }
}

