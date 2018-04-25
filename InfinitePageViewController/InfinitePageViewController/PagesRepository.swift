//
//  PagesRepository.swift
//  InfinitePageViewController
//
//  Created by htomcat on 2018/04/24.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import Foundation
import UIKit

class PagesRepository {
    private var pages: [UIViewController]

    init(pages: [UIViewController]) {
        self.pages = pages
    }
}

extension PagesRepository: EntityGateway {
    func fetchPages() -> [UIViewController] {
        return pages
    }
}
