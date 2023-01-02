//
//  LegoCollectionModel.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import Foundation
import UIKit

public class LegoCellItem: Hashable {

    public let id: UUID = UUID()
    public var label: String
    public var cellSize: CGSize
    public var cellType: LegoCollectionViewCell.Type

    init(label: String, cellSize: CGSize, cellType: LegoCollectionViewCell.Type) {
        self.label = label
        self.cellSize = cellSize
        self.cellType = cellType
    }

    public static func == (lhs: LegoCellItem, rhs: LegoCellItem) -> Bool {
        lhs.id.uuidString == rhs.id.uuidString
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public class LegoSupplemenatryItem: Hashable {

    public let id: UUID = UUID()
    public var index: Int
    public var viewHeight: CGFloat
    public var kind: String
    public var label: String?
    public var supplymentaryViewType: LegoCollectionSupplymentaryView.Type

    init(index: Int, viewHeight: CGFloat, kind: String, label: String? = nil, supplymentaryViewType: LegoCollectionSupplymentaryView.Type) {
        self.index = index
        self.viewHeight = viewHeight
        self.kind = kind
        self.label = label
        self.supplymentaryViewType = supplymentaryViewType
    }

    public static func == (lhs: LegoSupplemenatryItem, rhs: LegoSupplemenatryItem) -> Bool {
        lhs.index == rhs.index
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

public class LegoSection: Hashable {

    public var identifier: UUID = UUID()
    public var sectionHeaderItem: LegoSupplemenatryItem?
    public var sectionFooterItem: LegoSupplemenatryItem?
    public var sectionCellItems: [LegoCellItem]

    init(sectionHeaderItem: LegoSupplemenatryItem? = nil, sectionFooterItem: LegoSupplemenatryItem? = nil, sectionCellItems: [LegoCellItem]) {
        self.sectionHeaderItem = sectionHeaderItem
        self.sectionFooterItem = sectionFooterItem
        self.sectionCellItems = sectionCellItems
    }

    public static func == (lhs: LegoSection, rhs: LegoSection) -> Bool {
        lhs.identifier.uuidString == rhs.identifier.uuidString
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

///List Style Section
public class LegoVStackSection: LegoSection {

    public let cellHeight: CGFloat
    public let cellInsets: NSDirectionalEdgeInsets

    init(sectionHeaderItem: LegoSupplemenatryItem? = nil, sectionFooterItem: LegoSupplemenatryItem? = nil, sectionCellItems: [LegoCellItem], cellHeight: CGFloat, cellInsets: NSDirectionalEdgeInsets) {
        self.cellHeight = cellHeight
        self.cellInsets = cellInsets
        super.init(sectionHeaderItem: sectionHeaderItem, sectionFooterItem: sectionFooterItem, sectionCellItems: sectionCellItems)
    }
}

///Horizontal Carousel Style Section
public class LegoHStackSection: LegoSection {
    public let cellWidth: CGFloat
    public let cellInsets: NSDirectionalEdgeInsets

    init(sectionHeaderItem: LegoSupplemenatryItem? = nil, sectionFooterItem: LegoSupplemenatryItem? = nil, sectionCellItems: [LegoCellItem], cellWidth: CGFloat, cellInsets: NSDirectionalEdgeInsets) {
        self.cellWidth = cellWidth
        self.cellInsets = cellInsets
        super.init(sectionHeaderItem: sectionHeaderItem, sectionFooterItem: sectionFooterItem, sectionCellItems: sectionCellItems)
    }
}

///Grid Tile Style Section
public class LegoGridSection: LegoSection {
    public let numberOfItemsInRow: Int
    public let cellInsets: NSDirectionalEdgeInsets

    init(sectionHeaderItem: LegoSupplemenatryItem? = nil, sectionFooterItem: LegoSupplemenatryItem? = nil, sectionCellItems: [LegoCellItem], numberOfItemsInRow: Int, cellInsets: NSDirectionalEdgeInsets) {
        self.cellInsets = cellInsets
        self.numberOfItemsInRow = numberOfItemsInRow
        super.init(sectionHeaderItem: sectionHeaderItem, sectionFooterItem: sectionFooterItem, sectionCellItems: sectionCellItems)
    }
}
