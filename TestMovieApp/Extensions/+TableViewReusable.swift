//
//  +TableViewReusable.swift
//  TestMovieApp
//
//  Created by Орлов Максим on 10.07.2018.
//  Copyright © 2018 Орлов Максим. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ : T.Type) where T: Reusable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.identifier)")
        }
        return cell
    }
}
