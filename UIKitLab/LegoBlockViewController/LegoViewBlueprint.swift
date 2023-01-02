//
//  LegoViewBlueprint.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import UIKit
import Combine

public protocol LegoViewBlueprintDelegate: NSObject {

    var topViews: [UIView] { get }
    
    var bottomViews: [UIView] { get }
    
    func initializeLegoBlocks() async

    func assembleLegoBlocks() async
}
