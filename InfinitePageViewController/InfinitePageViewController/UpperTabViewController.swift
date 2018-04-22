//
//  UpperTabViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/14.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class UpperTabViewController: UIViewController {
    let tabsHeight: CGFloat = 60

    private lazy var collectionView: UICollectionView = self.initCollectionView()
    var dataSource: ModelController? {
        didSet {
            collectionView.reloadData()
        }
    }
    var delegate: CustomDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
    }

    private func initCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: tabsHeight)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tabsHeight), collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        return collectionView
    }

    func selectTab(at index: Int) {
        dataSource?.selectedIndex = index
        collectionView.reloadData()
    }
}
