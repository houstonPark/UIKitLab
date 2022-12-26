//
//  AsyncCollectionView.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/26.
//

import UIKit

open class AsyncCollectionViewController: UICollectionViewController {

    private weak var asyncHandler: (any AsyncCollectionHandler)!

    init(asyncHanlder: any AsyncCollectionHandler) {
        super.init(collectionViewLayout: asyncHanlder.collectionViewLayout)
        self.asyncHandler = asyncHanlder
        self.asyncHandler.collectionViewController = self
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await withTaskGroup(of: Void.self, body: { taskGroup in
                await self.asyncHandler.taskOfViewState(viewControllerDisplayState: .didLoad)
                self.asyncHandler.registerCells(self.collectionView)
            })
        }
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task { await self.asyncHandler.taskOfViewState(viewControllerDisplayState: .willAppear) }
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Task { await self.asyncHandler.taskOfViewState(viewControllerDisplayState: .didAppear) }
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Task { await self.asyncHandler.taskOfViewState(viewControllerDisplayState: .willDisappear) }
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Task { await self.asyncHandler.taskOfViewState(viewControllerDisplayState: .didDisappear) }
    }
}
