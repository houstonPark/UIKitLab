//
//  BaseNavigationController.swift
//  UIKitLab
//
//  Created by 박종우 on 2022/12/17.
//

import UIKit

public protocol NavigationPopDelegate: NSObject {

    var useCustomNavigationBackAction: Bool { get }

    func navigationController(shouldBegin: @escaping ((Bool) -> ()))
}

open class BaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    weak var navigationPopDelegate: NavigationPopDelegate?

    open func popViewController(animated: Bool, completion: @escaping (()-> ())) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let _ = popViewController(animated: animated)
        CATransaction.commit()
    }
    
    override open func popViewController(animated: Bool) -> UIViewController? {
        guard let popDelegate = navigationPopDelegate, popDelegate.useCustomNavigationBackAction else {
            return super.popViewController(animated: animated)
        }
        popDelegate.navigationController { [weak self] canPop in
            self?.popViewController(animated: animated, allowed: canPop)
        }
        return nil
    }
    
    func popViewController(animated: Bool, allowed: Bool) {
        if allowed { super.popViewController(animated: animated) }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let popDelegate = viewController as? NavigationPopDelegate else { return }
        navigationPopDelegate = popDelegate
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard viewControllers.count > 1 else { return false }
        guard let popDelegate = navigationPopDelegate, !popDelegate.useCustomNavigationBackAction else {
            let _ = popViewController(animated: true)
            return false
        }
        
        return true
    }
}

