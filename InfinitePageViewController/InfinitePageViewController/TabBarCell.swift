//
//  TabBarCell.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/22.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class TabBarCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "TabBarCell"

    // MARK: - IBOutlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var selectedLine: UIView!
    
}
