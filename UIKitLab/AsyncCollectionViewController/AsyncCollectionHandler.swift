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

public protocol AsyncCollectionHandler: NSObject {
    associatedtype SupplymentaryView = AsyncCollectionReusableView
    associatedtype Cell = AsyncCollectionViewCell

    @available(iOS 13.0, *)
    var useDiffableDataSource: Bool { get }

    var collectionViewLayout: UICollectionViewLayout { get }

    var collectionViewController: AsyncCollectionViewController { get set }

    func taskOfViewState(viewControllerDisplayState state: CollectionUIState) async

    func registerCells(_ collectionView: UICollectionView)

    func cellConfiguration(_ cell: Cell, cellForIndex at: IndexPath) async

    func supplymentaryViewConfiguration(_ view: SupplymentaryView, kind: String, viewForIndex at: IndexPath) async

    func cellClickAction(_ cell: Cell, clickedItem at: IndexPath) async

    func cellDisplayStateChanged(_ cell: Cell, changedDisplayState state: CollectionUIState) async

    func supplymentaryViewDisplayStateChanged(_ view: SupplymentaryView, changedDisplayState state: CollectionUIState) async
}

extension AsyncCollectionHandler {

    
}

open class AsyncCollectionReusableView: UICollectionReusableView {

    static var identifier: String = ""
}


open class AsyncCollectionViewCell: UICollectionViewCell {

    static var identifier: String = ""
}
