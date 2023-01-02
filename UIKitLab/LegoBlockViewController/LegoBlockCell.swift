//
//  LegoBlockCell.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import UIKit

protocol LegoBlockCellProtocol {
    associatedtype LegoData = LegoBlockData

    func configureCell(_ data: LegoData)
}

open class LegoBlockCell<LegoData>: UICollectionViewCell, LegoBlockCellProtocol where LegoData: LegoBlockData {
    
    static var identifier: String {
        String(describing: Self.self)
    }
    
    open func configureCell(_ data: LegoData) { }
}

class ImageLegoBlockCell: LegoBlockCell<ImageLegoBlockData> {

    override func configureCell(_ data: ImageLegoBlockData) {
        
    }
}
