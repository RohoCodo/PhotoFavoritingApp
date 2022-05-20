//
//  AlbumsAddMediaItems.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

internal class AlbumsAddMediaItems {
    internal init() {}
    
    internal class Request : BaseMappable {
        var id: String = ""
        var mediaItemIds = [String]()
        
        override func mapping(map: Map) {
            mediaItemIds <- map["mediaItemIds"]
        }
    }
    
}
