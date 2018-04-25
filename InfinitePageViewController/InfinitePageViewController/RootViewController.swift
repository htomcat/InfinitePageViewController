//
//  RootViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/18.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var dataSource: CustomDatasource?
    let delegate = CustomDelegate()

    func setPages(_ viewControllers: [UIViewController]) {
        let repository = PagesRepository(pages: viewControllers)
        dataSource = CustomDatasource(repository: repository)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vc as UpperTabViewController:
            delegate.upperTab = vc
            vc.delegate = delegate
            vc.dataSource = dataSource
        case let vc as PageViewController:
            vc.dataSource = dataSource
            delegate.pageController = vc
            vc.delegate = delegate
        default:
            break
        }
    }

}
