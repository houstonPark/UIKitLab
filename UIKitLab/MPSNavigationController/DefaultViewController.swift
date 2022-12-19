//
//  DefaultViewController.swift
//  UIKitLab
//
//  Created by 박종우 on 2022/12/17.
//

import UIKit

open class DefaultViewController: UIViewController, NavigationPopDelegate {

    public var useCustomNavigationBackAction: Bool = false

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

    public func navigationController(shouldBegin: @escaping ((Bool) -> ())) {
        shouldBegin(true)
    }
}
