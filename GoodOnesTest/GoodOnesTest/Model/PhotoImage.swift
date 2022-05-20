//
//  PhotoImage.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import SwiftUI
import Photos

struct PhotoImage: Hashable {
    var id: Int
    var im: UIImage
    var choice: FavoriteDismiss
    var ass: PHAsset
}
