//
//  LegoCollectionSupplymentaryView.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import UIKit

open class LegoCollectionSupplymentaryView: UICollectionReusableView, LegoCollectionSupplymentaryViewDelegate {

    static var identifier: String {
        String(describing: self)
    }

    public func collectionSupplymentaryView(_ viewController: UIViewController, kind: String, configure data: LegoSupplemenatryItem) {

    }
}
