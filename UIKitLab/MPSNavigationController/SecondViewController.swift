//
//  SecondViewController.swift
//  UIKitLab
//
//  Created by 박종우 on 2022/12/17.
//

import UIKit

class SecondViewController: DefaultViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        useCustomNavigationBackAction = true
    }

    override func navigationController(shouldBegin: @escaping ((Bool) -> ())) {

        let alertController = UIAlertController(title: "Alert", message: "AlertMessage", preferredStyle: .alert)
        let popAction = UIAlertAction(title: "POP", style: .default) { _ in
            alertController.dismiss(animated: true) {
                shouldBegin(true)
            }
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel) { _ in
            alertController.dismiss(animated: true) {
                shouldBegin(false)
            }
        }
        alertController.addAction(popAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
