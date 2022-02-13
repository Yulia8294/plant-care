//
//  UITableViewTools.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/26/22.
//

import UIKit

extension UITableView {
    
    func cell<T>(_ type: T.Type) -> T {
        dequeueReusableCell(withIdentifier: String(describing: type)) as! T
    }
    
    func registerCell<T>(_ type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: type))
    }
    
    func registerCellClass<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func registerView<T>(_ type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: type))
    }
    
    func view<T>(_ type: T.Type) -> T {
        dequeueReusableHeaderFooterView(withIdentifier: String(describing: type)) as! T
    }
    
    func updateHeight() {
        DispatchQueue.main.async {
            self.beginUpdates()
            self.endUpdates()
        }
    }
}
