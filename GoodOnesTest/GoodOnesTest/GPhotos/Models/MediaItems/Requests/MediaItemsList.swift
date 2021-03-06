//
//  MediaItemsList.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

internal class MediaItemsList {
    internal init() {}
    
    internal class Request : BaseMappable {
        var pageSize: Int?
        var pageToken: String?
        
        override func mapping(map: Map) {
            pageSize <- map["pageSize"]
            pageToken <- map["pageToken"]
        }
    }
    
    internal class Response : BaseMappable {
        var nextPageToken: String?
        var mediaItems = [MediaItem]()
        
        override func mapping(map: Map) {
            nextPageToken <- map["nextPageToken"]
            mediaItems <- map["mediaItems"]
        }
    }

}
