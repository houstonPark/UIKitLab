//
//  LegoBlockViewController.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import UIKit

class LegoBlockViewController: DefaultViewController {

    @IBOutlet weak var backgroundVerticalStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!

    weak var blueprint: LegoViewBlueprintDelegate!

    static func create(blueprint: LegoViewBlueprintDelegate) -> LegoBlockViewController {
        let identifier = LegoBlockViewController.identifier
        let storyboard = UIStoryboard(name: identifier, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! LegoBlockViewController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        insertTopBottomViews()
    }
}

private extension LegoBlockViewController {

    private func insertTopBottomViews() {
        blueprint.topViews.forEach { [weak self] view in
            self?.backgroundVerticalStackView.insertSubview(view, at: 0)
        }

        blueprint.bottomViews.forEach { [weak self] view in
            guard let self = self else { return }
            self.backgroundVerticalStackView.insertSubview(view, aboveSubview: self.collectionView)
        }
    }
}
