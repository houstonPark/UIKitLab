//
//  LegoViewBlueprint.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import UIKit
import Combine

public protocol LegoViewBlueprintDelegate {

    func initializeLegoBlocks() async

    func assembleLegoBlocks() async
}
