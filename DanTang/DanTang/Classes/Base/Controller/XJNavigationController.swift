//
//  XJNavigationController.swift
//  DanTang
//
//  Created by qxj on 2017/3/7.
//  Copyright © 2017年 QinXJ. All rights reserved.
//

import UIKit

class XJNavigationController: UINavigationController {
    
    internal override class func initialize() {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = XJGlobalRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)];
    }
    
    /// 统一所有控制器左上角返回按钮
    /// 让所有push进来的控制器左上角的返回按钮都一样
    /// - Parameters:
    ///   - viewController: 需要压栈的控制器
    ///   - animated: 是否动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: ""), style: .plain, target: self, action: #selector(navitationBackClick))
        }
    }
    
    /// 返回按钮
    func navitationBackClick() {
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }

}
