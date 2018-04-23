//
//  UpperTabViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/14.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class UpperTabViewController: UIViewController {

    // MARK: - Properties
    let tabsHeight: CGFloat = 60
    private lazy var collectionView: UICollectionView = self.initCollectionView()
    var dataSource: CustomDatasource? {
        didSet {
            collectionView.reloadData()
        }
    }
    var delegate: CustomDelegate?

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }

    // MARK: - Methods
    /**
     * Initialize collection view
     */
    private func initCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: tabsHeight)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tabsHeight), collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "TabBarCell", bundle: nil), forCellWithReuseIdentifier: TabBarCell.identifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }

    /**
     * call when tab is selected by user
     */
    func selectTab(at index: Int) {
        dataSource?.selectedIndex = index
        collectionView.reloadData()
    }
}
