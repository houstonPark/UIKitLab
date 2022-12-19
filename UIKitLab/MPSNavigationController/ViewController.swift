//
//  ViewController.swift
//  UIKitLab
//
//  Created by 박종우 on 2022/12/17.
//

import UIKit

class ViewController: DefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func firstButtonAction(_ sender: Any) {
        guard let secondViewController = UIStoryboard(name: SecondViewController.identifier, bundle: .main).instantiateInitialViewController() as? SecondViewController else { return }
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func secondButtonAction(_ sender: Any) {
        guard let thirdViewController = UIStoryboard(name: ThirdViewController.identifier, bundle: .main).instantiateInitialViewController() as? ThirdViewController else { return }

        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

