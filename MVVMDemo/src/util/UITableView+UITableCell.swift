//
//  UITableView+UITableCell.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/2/11.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        self.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
