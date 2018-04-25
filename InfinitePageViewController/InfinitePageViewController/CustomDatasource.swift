//
//  CustomDatasource.swift
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

protocol InifitePageViewDatasource {
    var pages: [UIViewController] { set get }
    var selectedIndex: Int { set get }
}

class CustomDatasource: NSObject, InifitePageViewDatasource {

    var pages: [UIViewController] = []
    var selectedIndex = 0

    init(repository: PagesRepository) {
        pages = repository.fetchPages()
    }

    func indexOfViewController(_ viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pages.index(of: viewController) ?? NSNotFound
    }
}

// MARK: - UITableViewDatasource
extension CustomDatasource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCell.identifier, for: indexPath) as! TabBarCell
        if indexPath.row == selectedIndex {
            cell.selectedLine.backgroundColor = .gray
        } else {
            cell.selectedLine.backgroundColor = .white
        }
        let title = pages[indexPath.row].title
        cell.title.text = title
        return cell
    }
}

// MARK: - UIPageViewControllerDataSource
extension CustomDatasource: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
}
