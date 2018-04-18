//
//  PageViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/17.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    var pages: [UIViewController]?
    var pageViewController: UIPageViewController?
    let dataSource = ModelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = UIViewController()
        view1.view.backgroundColor = .red
        let view2 = UIViewController()
        view2.view.backgroundColor = .yellow
        pages = [view1, view2]
        pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        pageViewController!.setViewControllers([(pages?.first)!], direction: .forward, animated: false) { result in
        }
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
        pageViewController?.willMove(toParentViewController: self)
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParentViewController: self)
    }
}
extension PageViewController: UIPageViewControllerDelegate {
    
}
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages?.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pages?.last }
        
        guard (pages?.count)! > previousIndex else { return nil        }
        
        return pages?[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages?.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < (pages?.count)! else { return pages?.first }
        
        guard (pages?.count)! > nextIndex else { return nil         }
        
        return pages?[nextIndex]
    }
}
