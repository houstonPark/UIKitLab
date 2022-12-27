//
//  LegoCollectionModel.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import Foundation

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

public class LegoSupplymenatryItem: Hashable {

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

    public static func == (lhs: LegoSupplymenatryItem, rhs: LegoSupplymenatryItem) -> Bool {
        lhs.index == rhs.index
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

public class LegoSection: Hashable {

    public var identifier: UUID = UUID()
    public var supplymentaryItem: LegoSupplymenatryItem
    public var sectionCellItems: [LegoCellItem]

    init(supplymentaryItem: LegoSupplymenatryItem, sectionCellItems: [LegoCellItem]) {
        self.supplymentaryItem = supplymentaryItem
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

    public let sectionWidth: CGFloat

    init(supplymentaryItem: LegoSupplymenatryItem, sectionCellItems: [LegoCellItem], sectionWidth: CGFloat) {
        self.sectionWidth = sectionWidth
        super.init(supplymentaryItem: supplymentaryItem, sectionCellItems: sectionCellItems)
    }
}

///Horizontal Carousel Style Section
public class LegoHStackSection: LegoSection {
    public let sectionHeight: CGFloat

    init(supplymentaryItem: LegoSupplymenatryItem, sectionCellItems: [LegoCellItem], sectionHeight: CGFloat) {
        self.sectionHeight = sectionHeight
        super.init(supplymentaryItem: supplymentaryItem, sectionCellItems: sectionCellItems)
    }
}

///Grid Tile Style Section
public class LegoGridSection: LegoSection {
    public let numberOfItemsInRow: Int
    public let interItemSpace: (vertical: CGFloat, horizontal: CGFloat)

    init(supplymentaryItem: LegoSupplymenatryItem, sectionCellItems: [LegoCellItem], numberOfItemsInRow: Int, interItemSpace: (vertical: CGFloat, horizontal: CGFloat) = (20, 20)) {
        self.interItemSpace = interItemSpace
        self.numberOfItemsInRow = numberOfItemsInRow
        super.init(supplymentaryItem: supplymentaryItem, sectionCellItems: sectionCellItems)
    }
}
