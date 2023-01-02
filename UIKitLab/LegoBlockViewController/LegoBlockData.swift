//
//  LegoBlockData.swift
//  UIKitLab
//
//  Created by Houston Park on 2023/01/02.
//

import Foundation

open class LegoBlockData {

    public var id: String
    public var value: String

    init(id: String = UUID().uuidString, value: String) {
        self.id = id
        self.value = value
    }
}

class ImageLegoBlockData: LegoBlockData {

    public var imageURL: URL

    init(id: String = UUID().uuidString, value: String, imageURL: URL) {
        self.imageURL = imageURL
        super.init(id: id, value: value)
    }
}
