//
//  MediaItem.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

public class MediaItem: BaseMappable {
    public var id = ""
    public var description = ""
    public var mimeType = ""
    public var filename = ""
    public var baseUrl: URL?
    public var productUrl: URL?
    public var mediaMetadata: MediaMetadata?
    
    public override func mapping(map: Map) {
        baseUrl <- (map["baseUrl"], URLTransform())
        productUrl <- (map["productUrl"], URLTransform())
        
        id <- map["id"]
        filename <- map["filename"]
        mimeType <- map["mimeType"]
        description <- map["description"]
        
        mediaMetadata <- map["mediaMetadata"]
    }
    
}
