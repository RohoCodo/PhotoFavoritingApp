//
//  MediaMetadata.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

public class MediaMetadata: BaseMappable {
    
    public var creationTime: Date?
    public var height = 0
    public var width = 0
    public var photo: Photo?
//    public var video: Video?
    
    // Mappable
    public override func mapping(map: Map) {
        creationTime <- (map["creationTime"], ISO8601DateTransform())
        height <- map["height"]
        width <- map["width"]
        photo <- map["photo"]
//        video <- map["video"]
    }
    
}
