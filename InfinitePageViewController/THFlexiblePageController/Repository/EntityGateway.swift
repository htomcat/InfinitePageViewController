//
//  EntityGateway.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/24.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

protocol EntityGateway {
    func fetchPages() -> [UIViewController]
}
