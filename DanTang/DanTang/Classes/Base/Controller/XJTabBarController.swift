//
//  XJTabBarController.swift
//  DanTang
//
//  Created by qxj on 2017/3/7.
//  Copyright © 2017年 QinXJ. All rights reserved.
//

import UIKit

class XJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
        // 添加子控制器
        addChildViewControllers()
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        addChildViewController("XJDanTangViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController("XJProductViewController", title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController("XJCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController("XJMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    
    /// 初始化控制器
    ///
    /// - Parameters:
    ///   - childController: 需要初始化的控制器
    ///   - title: 标题
    ///   - imageName: 图片名
    private func addChildViewController(_ childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init();
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = XJNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }

}
