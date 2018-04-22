//
//  ModelController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/14.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

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
class ModelController: NSObject {

    var pageData: [UIViewController] = []
    var selectedIndex = 0
    override init() {
        super.init()
        // Create the data model.
        let view1 = Test1ViewController()
        view1.view.backgroundColor = .red
        let view2 = Test2ViewController()
        view2.view.backgroundColor = .yellow
        let view3 = Test3ViewController()
        view3.view.backgroundColor = .blue
        let view4 = Test4ViewController()
        view4.view.backgroundColor = .white
        let view5 = Test5ViewController()
        view5.view.backgroundColor = .black
        pageData = [view1, view2, view3, view4, view5]
    }

    func indexOfViewController(_ viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController) ?? NSNotFound
    }
}

// MARK: - UITableViewDatasource
extension ModelController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if indexPath.row == selectedIndex {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        return cell
    }
}

// MARK: - UIPageViewControllerDataSource
extension ModelController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pageData.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pageData.last }
        
        guard pageData.count > previousIndex else { return nil        }
        
        return pageData[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pageData.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pageData.count else { return pageData.first }
        
        guard pageData.count > nextIndex else { return nil }
        
        return pageData[nextIndex]
    }
}
