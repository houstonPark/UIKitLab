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
            var sectionSupplementaryItems: [LegoSupplemenatryItem] = []
            if let sectionHeader = section.sectionHeaderItem { sectionSupplementaryItems.append(sectionHeader) }
            if let sectionFooter = section.sectionFooterItem { sectionSupplementaryItems.append(sectionFooter) }
            sectionSupplementaryItems.forEach { supplementaryItem in
                let kind = supplementaryItem.kind
                let type = supplementaryItem.supplymentaryViewType
                let identifier = type.identifier
                collectionView.register(type, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
            }
            section.sectionCellItems.forEach { cell in
                let cellType = cell.cellType
                let cellIdentifier = cellType.identifier
                collectionView.register(cellType, forCellWithReuseIdentifier: cellIdentifier)
            }
        }
    }

    open func setCompositionalLayoutConfiguration() -> UICollectionViewCompositionalLayoutConfiguration {
        return UICollectionViewCompositionalLayoutConfiguration()
    }

    open func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let configuration = setCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, environment in
            guard let this = self,
                  this.sections.value.count > sectionIndex else {
                return nil
            }
            let legoSection = this.sections.value[sectionIndex]

            //VStack Section
            if let vStackSection = legoSection as? LegoVStackSection {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(vStackSection.cellHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = vStackSection.cellInsets
                let groupSize = itemSize
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return section
            }

            if let hStackSection = legoSection as? LegoHStackSection {
                
            }

            return nil
        }, configuration: configuration)
        return layout
    }
}
