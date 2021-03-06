//
//  MediaItemsBatchCreate.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

internal class MediaItemsBatchGet {
    internal init() {}
    
    internal class Request : BaseMappable {
        var mediaItemIds = [String]()
        
        override func mapping(map: Map) {
            mediaItemIds <- map["mediaItemIds"]
        }
    }
    
    internal class Response : BaseMappable {
        var mediaItemResults = [MediaItemResult]()
        
        override func mapping(map: Map) {
            mediaItemResults <- map["mediaItemResults"]
        }
    }
    
    internal class MediaItemResult : BaseMappable {
        var status: Status?
        var mediaItem: MediaItem?
        
        override func mapping(map: Map) {
            status <- map["status"]
            mediaItem <- map["mediaItem"]
        }
    }
    
}
