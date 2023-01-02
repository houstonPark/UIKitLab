//
//  LegoCollectionViewController.swift
//  UIKitLab
//
//  Created by Houston Park on 2022/12/27.
//

import UIKit
import Combine

open class LegoCollectionViewController: UICollectionViewController {

    private var dataSource: UICollectionViewDiffableDataSource<LegoSupplemenatryItem, LegoCellItem>? = nil

    static let identifier: String = String(describing: LegoCollectionViewController.self)

    public var viewModel: LegoCollectionViewModel!

    private var cancellable = Set<AnyCancellable>()

    static func create(viewModel: LegoCollectionViewModel) -> Self {
        let viewController = UIStoryboard(name: Self.identifier, bundle: .main).instantiateInitialViewController() as! Self
        viewController.viewModel = viewModel
        return viewController
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModelDataSource()
//        viewModel.registerCells(collectionView)
        setDiffableDataSource()
    }

    private func subscribeViewModelDataSource() {
//        viewModel.sections
//            .sink { result in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .finished:
//                    break
//                }
//            } receiveValue: { legoSectionItems in
//
//            }
//            .store(in: &cancellable)
    }

    private func setDiffableDataSource() {
        dataSource = UICollectionViewDiffableDataSource<LegoSupplemenatryItem, LegoCellItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier.cellType.identifier, for: indexPath) as? LegoCollectionViewCell
            cell?.collectionViewCell(self, configure: itemIdentifier)
            return cell
        })
//        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
//            guard let this = self,
//                  let item = self?.viewModel.sections.value[indexPath.section].sectionHeaderItem else { return UICollectionReusableView() }
//            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: item.supplymentaryViewType.identifier, for: indexPath) as? LegoCollectionSupplymentaryView
//
//            supplementaryView?.collectionSupplymentaryView(this, kind: kind, configure: item)
//
//            return supplementaryView
//        }
    }

    private func setCompositionalLayout() {
        
    }
}
