//
//  LegoCollectionViewCellDelegate.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import UIKit

public protocol LegoCollectionViewCellDelegate: NSObject {

    func collectionViewCell(_ viewController: UIViewController, didSelected at: IndexPath, userInfo: [String: Any]?)

    func collectionViewCell(_ viewController: UIViewController, configure data: LegoCellItem)
}

public protocol LegoCollectionSupplymentaryViewDelegate: NSObject {

    func collectionSupplymentaryView(_ viewController: UIViewController, kind: String, configure data: LegoSupplemenatryItem)
}
