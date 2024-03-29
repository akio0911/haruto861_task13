//
//  FruitsTableViewCell.swift
//  haruto861_Task13
//
//  Created by 松島悠人 on 2021/06/14.
//

import UIKit

protocol RegisterableCell {
    static var identiefier: String { get }
    static var nibName: String { get }
}

extension UITableView {
    // TはUITableViewCellプロトコルに準拠した方をとる -> 制約型
    // (cell: T.Type) -> UITableviewCellに準拠したTを型とする
    // where -> where以下の条件を満たす場合のみ有効
    func register<T: UITableViewCell>(cell: T.Type) where T: RegisterableCell {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.identiefier)
    }
}

class FruitsTableViewCell: UITableViewCell, RegisterableCell {

    @IBOutlet private weak var fruitsNameLabel: UILabel!
    @IBOutlet private weak var chechmarkImageView: UIImageView!

    static var identiefier: String {
        className
    }

    static var nibName: String {
        className
    }

    static var className : String {
        return String(describing: self)
    }

    func configure(fruitsName: String, checkImageUrl: String) {
        fruitsNameLabel.text = fruitsName
        chechmarkImageView.image = UIImage(named: checkImageUrl) 
    }
}
