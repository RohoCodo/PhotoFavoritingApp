//
//  AlbumsAddEnrichment.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

internal class AlbumsAddEnrichment {
    internal init() {}
    
    internal class Request : BaseMappable {
        var id: String = ""
        var newEnrichmentItem: NewEnrichmentItem?
        var albumPosition: AlbumPosition?
        
        override func mapping(map: Map) {
            newEnrichmentItem <- map["newEnrichmentItem"]
            albumPosition <- map["albumPosition"]
        }
    }
    
    internal class Response : BaseMappable {
        var enrichmentItem: EnrichmentItem?
        
        override func mapping(map: Map) {
            enrichmentItem <- map["enrichmentItem"]
        }
    }
    
}
