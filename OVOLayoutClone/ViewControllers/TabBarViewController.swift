//
//  TabBarViewController.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 17/01/24.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        
        let homeVC = HomeViewController()
        let financeVC = FinanceViewController()
        let paymentVC = PaymentViewController()
        let inboxVC = InboxViewController()
        let profileVC = ProfileViewController()
        
        financeVC.title = "Finance"
        inboxVC.title = "Notifications"
        profileVC.title = "Profile"
        
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: financeVC)
        let nav3 = UINavigationController(rootViewController: paymentVC)
        let nav4 = UINavigationController(rootViewController: inboxVC)
        let nav5 = UINavigationController(rootViewController: profileVC)
        
        nav5.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        nav2.tabBarItem = UITabBarItem(
            title: "Finance",
            image: UIImage(systemName: "dollarsign.circle.fill"),
            tag: 0
        )
        nav3.tabBarItem = UITabBarItem(
            title: "Pay",
            image: UIImage(systemName: "banknote.fill"),
            tag: 0
        )
        nav4.tabBarItem = UITabBarItem(
            title: "Inbox",
            image: UIImage(systemName: "bell.fill"),
            tag: 0
        )
        nav5.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.crop.circle.fill"),
            tag: 0
        )
        
        setViewControllers([
            nav1,
            nav2,
            nav3,
            nav4,
            nav5
        ],
        animated: true)
    }

}
