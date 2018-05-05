//
//  AppDelegate.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/14.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit
import THFlexiblePageController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = RootViewController.makeInstance()
        let view1 = Test1ViewController()
        view1.title = "title1"
        view1.view.backgroundColor = .red
        let view2 = Test2ViewController()
        view2.title = "title2"
        view2.view.backgroundColor = .yellow
        let view3 = Test3ViewController()
        view3.title = "title3"
        view3.view.backgroundColor = .blue
        let view4 = Test4ViewController()
        view4.title = "title4"
        view4.view.backgroundColor = .white
        let view5 = Test5ViewController()
        view5.title = "title5"
        view5.view.backgroundColor = .black
        let sample = [view1, view2, view3, view4, view5]
        vc.setPages(sample)

        window = UIWindow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

class Test1ViewController: UIViewController {
}

class Test2ViewController: UIViewController {
}

class Test3ViewController: UIViewController {
}

class Test4ViewController: UIViewController {
}

class Test5ViewController: UIViewController {
}

