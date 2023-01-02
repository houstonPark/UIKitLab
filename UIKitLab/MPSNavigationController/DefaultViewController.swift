//
//  DefaultViewController.swift
//  UIKitLab
//
//  Created by 박종우 on 2022/12/17.
//

import UIKit

open class DefaultViewController: UIViewController, NavigationPopDelegate {

    public var useCustomNavigationBackAction: Bool = false

    public private(set) var creationInfo: [String: Any]? = nil

    static var identifier: String {
        String(describing: self)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Self.identifier
        if #available(iOS 14.0, *) {
            navigationItem.backButtonDisplayMode = .minimal
        } else {
            navigationItem.backButtonTitle = ""
        }
    }

    static func create(creationInfo: [String: Any]? = nil) -> Self {
        let storyboard = UIStoryboard(name: Self.identifier, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.identifier) as! Self
        viewController.creationInfo = creationInfo
        return viewController
    }

    public func navigationController(shouldBegin: @escaping ((Bool) -> ())) {
        shouldBegin(true)
    }
}
