//
//  ViewController.swift
//  iOSBasicDay06
//
//  Created by Hung Vuong on 4/9/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name: String
    var phone: Int
    init(name: String = "", phone: Int = 0) {
        self.name = name
        self.phone = phone
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var leftButton: TabBarView!
    @IBOutlet weak var rightButton: TabBarView!
    @IBOutlet weak var centerButton: TabBarView!
    @IBOutlet weak var tableView: UITableView!
    var inSearchMode = false
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var myNavigationBar: NavigationBar?
    var arr1: [Contact] = []
    var arr2: [Contact] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewControllerA = storyboard.instantiateViewController(withIdentifier: "ViewControllerA")
        viewControllers = [viewControllerA]
        arr1.append(Contact(name: "asdasd", phone: 123123))
        arr1.append(Contact(name: "Phong", phone: 1234945))
        arr1.append(Contact(name: "Anh", phone: 123123))
        arr1.append(Contact(name: "Hung", phone: 123123))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "NameCell", bundle: nil), forCellReuseIdentifier: "1")
        tableView.tableHeaderView = searchBar
        definesPresentationContext = true
        searchBar.delegate = self
    }
}

extension ViewController : ButtonTapDelegate {
    func tapButton(tag: Int) {
        
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode {
            return arr2.count
        } else {
            return arr1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "1") as? NameCell {
            var mem : Contact
            if inSearchMode{
                mem = arr2[indexPath.row]
            } else {
                mem = arr1[indexPath.row]
            }
            cell.setData(data: mem.name)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerA") as! ViewControllerA
        if inSearchMode {
            vc.textName.text = arr2[indexPath.row].name
            vc.textNumber.text = String(arr2[indexPath.row].phone)
        } else {
            vc.textName.text = arr1[indexPath.row].name
            vc.textNumber.text = String(arr1[indexPath.row].phone)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            self.searchBar.showsCancelButton = false
            self.tableView.reloadData()
        } else {
            inSearchMode = true
            
            arr2 = arr1.filter({( cus : Contact) -> Bool in
                cus.name.lowercased().contains(searchText.lowercased())
            })
            self.tableView.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.searchBar.showsCancelButton = false
    }
    
}





