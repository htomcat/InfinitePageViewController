//
//  PageViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/17.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    var pageViewController: UIPageViewController?
    var dataSource: CustomDatasource?
    var delegate: CustomDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        pageViewController!.setViewControllers([(dataSource?.pageData.first)!], direction: .forward, animated: false) { result in
        }
        pageViewController?.dataSource = dataSource
        pageViewController?.delegate = delegate
        pageViewController?.willMove(toParentViewController: self)
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParentViewController: self)
    }
}
