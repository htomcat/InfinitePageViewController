//
//  UpperTabViewController.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/14.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class UpperTabViewController: UIViewController {

    let dataSource = ModelController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 60)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60), collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        view.addSubview(collectionView)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
