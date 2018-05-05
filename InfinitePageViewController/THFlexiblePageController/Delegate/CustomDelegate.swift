//
//  CustomDelegate.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/20.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class CustomDelegate: NSObject {
    var pageController: PageViewController?
    var upperTab: UpperTabViewController?
    var pageIndex: Int? {
        didSet {
            upperTab?.selectTab(at: pageIndex!)
        }
    }
}

extension CustomDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        // Make page view scroll
        pageController?.pageViewController?.setViewControllers([(pageController?.dataSource?.pages[indexPath.row])!],
                                                               direction: .forward,
                                                               animated: false,
                                                               completion: nil)

        // Switch selected tab
        upperTab?.selectTab(at: indexPath.row)

        // Centralize tab's postion
        upperTab?.centralize(at: indexPath.row)
    }
}

extension CustomDelegate: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard completed else {
            return
        }

        guard let vc = pageViewController.viewControllers?.first else {
            return
        }

        guard let index = self.pageController?.dataSource?.indexOfViewController(vc) else {
            return
        }

        // Switch selected tab
        upperTab?.selectTab(at: index)

        // Centralize tab's postion
        upperTab?.centralize(at: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    }
}
