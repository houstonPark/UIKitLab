//
//  AsyncCollectionHandler.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/26.
//

import UIKit

public enum CollectionUIState {
    case didLoad
    case willAppear
    case didAppear
    case willDisappear
    case didDisappear
}

@available(iOS 13.0, *)
public protocol AsyncCollectionHandler: NSObject {
    associatedtype SupplymentaryView = AsyncCollectionReusableView
    associatedtype Cell = AsyncCollectionViewCell
    associatedtype SectionItem = AsyncCollectionItem
    associatedtype CellItem = AsyncCollectionItem

    var collectionViewLayout: UICollectionViewLayout { get }

    var collectionViewController: AsyncCollectionViewController { get set }
    
    func taskOfViewState(viewControllerDisplayState state: CollectionUIState) async

    func registerCells(_ collectionView: UICollectionView)

    func prefetchData(_ cell: Cell, cellForIndex at: IndexPath) async

    func collectionViewCell(_ collectionView: UICollectionView, cellForItem at: IndexPath) async -> Cell
    
    func supplymentaryViewConfiguration(_ collectionView: UICollectionView, kind: String, viewForIndex at: IndexPath) async -> SupplymentaryView

    func cellClickAction(_ cell: Cell, clickedItem at: IndexPath) async

    func cellDisplayStateChanged(_ cell: Cell, changedDisplayState state: CollectionUIState) async

    func supplymentaryViewDisplayStateChanged(_ view: SupplymentaryView, changedDisplayState state: CollectionUIState) async
}

extension AsyncCollectionHandler {
    
}

public struct AsyncCollectionItem: Hashable {
    
    public var id: String = UUID().uuidString
    
    public static func == (lhs: AsyncCollectionItem, rhs: AsyncCollectionItem) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(<#T##value: Hashable##Hashable#>)
    }
}

open class AsyncCollectionReusableView: UICollectionReusableView {

    static var identifier: String = ""
}


open class AsyncCollectionViewCell: UICollectionViewCell {

    static var identifier: String = ""
}
