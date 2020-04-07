//
//  MainTabBarController.swift
//  iOSBasicDay3
//
//  Created by Hung Vuong on 4/6/20.
//  Copyright © 2020 Hung Vuong. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineListViewController()
        selectedIndex = 0 //Đại diện của index trong mảng của ViewController
    }
    
    func defineListViewController() {
        var listVC = [UIViewController]() // Khởi tạo mảng của View
        let indexVc = self.setTabBarItems(id: "ViewControllerIndex", image: "4", selectedImage: "5",title: "Index") // Khởi tạo ViewControllerIndex index = 0
        listVC.append(indexVc)
        let notiVc = self.setTabBarItems(id: "ViewControllerNoti", image: "0", selectedImage: "1",title: "Notification")
        listVC.append(notiVc) // Khởi tạo ViewControllerNoti index = 1
        let infoVc = self.setTabBarItems(id: "ViewControllerInfo", image: "2", selectedImage: "3",title: "Info")
        listVC.append(infoVc) // Khởi tạo ViewControllerÌno index = 2
        self.viewControllers = listVC //Khi cấu hình tabbar thì sẽ sử dụng đc thuộc tính này để xác định mỗi content của mỗi tab. Thứ tự của mảng view controller sẽ tương ứng với thứ tự của các tabbar
    }
    
    private func setTabBarItems(id: String, image: String, selectedImage: String, title: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Gán = Main.storyboard
        let vc = storyboard.instantiateViewController(withIdentifier: id)
        vc.tabBarItem.image = UIImage(named: image)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc.tabBarItem.title = title
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        vc.tabBarController?.tabBar.tintColor = .darkGray
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 14)!,NSAttributedString.Key.foregroundColor:UIColor.darkGray]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 16)!,NSAttributedString.Key.foregroundColor:UIColor.darkGray]
        tabBar.standardAppearance = appearance
        return vc
    }
}
