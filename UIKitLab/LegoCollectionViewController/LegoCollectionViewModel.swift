//
//  File.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import UIKit
import Combine

open class LegoCollectionViewModel {

    public var sections: CurrentValueSubject<[LegoSection], Error> = .init([])

    init(sections: [LegoSection]) {
        self.sections.send(sections)
    }

    public func viewControllerCreate() -> LegoCollectionViewController {
        LegoCollectionViewController.create(viewModel: self)
    }

    open func registerCells(_ collectionView: UICollectionView) {
        sections.value.forEach { section in
            let kind = section.supplymentaryItem.kind
            let type = section.supplymentaryItem.supplymentaryViewType
            let identifier = type.identifier
            collectionView.register(section.supplymentaryItem.supplymentaryViewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
            section.sectionCellItems.forEach { cell in
                let cellType = cell.cellType
                let cellIdentifier = cellType.identifier
                collectionView.register(cell.cellType, forCellWithReuseIdentifier: cellIdentifier)
            }
        }
    }

    open func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
    }
}
