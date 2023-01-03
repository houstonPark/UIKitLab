//
//  LegoBlock.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import UIKit

protocol LegoBlockProtocol {

    associatedtype LegoData = LegoBlockData
    associatedtype LegoCell = LegoBlockCell<LegoBlockData>

    func configureLegoBlock(_ cell: LegoCell, data: LegoData) -> LegoCell
}

protocol LegoClusterProtocol {

}

class LegoBlock<Cell>: LegoBlockProtocol where Cell: LegoBlockCell<LegoBlockData> {

    func configureLegoBlock(_ cell: LegoBlockCell<LegoBlockData>, data: LegoBlockData) -> LegoBlockCell<LegoBlockData> {
        cell.configureCell(data)
        return cell
    }
}

class LegoCluster {


}
