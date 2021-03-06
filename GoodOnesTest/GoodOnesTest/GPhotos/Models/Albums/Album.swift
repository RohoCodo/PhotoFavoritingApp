//
//  Album.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

public class Album: BaseMappable {
    public var id = ""
    public var title = ""
    public var productUrl = ""
    public var mediaItemsCount = ""
    public var coverPhotoMediaItemId = ""
    public var isWriteable: Bool?
    public var coverPhotoBaseUrl: URL?
//    public var shareInfo: ShareInfo?
    
    public override func mapping(map: Map) {
        coverPhotoBaseUrl <- (map["coverPhotoBaseUrl"], URLTransform())
        isWriteable <- map["isWriteable"]
//        shareInfo <- map["shareInfo"]
        
        id <- map["id"]
        title <- map["title"]
        productUrl <- map["productUrl"]
        mediaItemsCount <- map["mediaItemsCount"]
        coverPhotoMediaItemId <- map["coverPhotoMediaItemId"]
    }
    
}
