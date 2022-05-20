//
//  AlbumsList.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

internal class AlbumsList {
    internal init() {}
    
    internal class Request : BaseMappable {
        var pageSize: Int?
        var pageToken: String?
        var excludeNonAppCreatedData: Bool?
        
        override func mapping(map: Map) {
            pageSize <- map["pageSize"]
            pageToken <- map["pageToken"]
            excludeNonAppCreatedData <- map["excludeNonAppCreatedData"]
        }
    }
    
    internal class Response : BaseMappable {
        var nextPageToken: String?
        var albums = [Album]()
        
        override func mapping(map: Map) {
            nextPageToken <- map["nextPageToken"]
            albums <- map["albums"]
        }
    }
    
}
