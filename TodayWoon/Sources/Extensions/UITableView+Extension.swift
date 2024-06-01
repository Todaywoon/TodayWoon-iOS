//
//  UITableView+Extension.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit

protocol ReusableCell {
    static var identifier: String { get }
}

extension ReusableCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: ReusableCell {
        self.register(cellType, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
