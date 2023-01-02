//
//  LegoCollectionViewCell.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import UIKit

open class LegoCollectionViewCell: UICollectionViewCell, LegoCollectionViewCellDelegate {

    static var identifier: String {
        String(describing: self)
    }

    public func collectionViewCell(_ viewController: UIViewController, didSelected at: IndexPath, userInfo: [String : Any]?) {

    }

    public func collectionViewCell(_ viewController: UIViewController, configure data: LegoCellItem) {

    }
}
