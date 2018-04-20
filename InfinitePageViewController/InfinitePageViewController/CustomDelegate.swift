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
}

extension CustomDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        pageController?.pageViewController?.setViewControllers([(pageController?.dataSource?.pageData[indexPath.row])!],
                                                               direction: .forward,
                                                               animated: true,
                                                               completion: nil)
    }
}

extension CustomDelegate: UIPageViewControllerDelegate {
}
