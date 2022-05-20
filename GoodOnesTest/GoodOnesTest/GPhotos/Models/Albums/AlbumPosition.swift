//
//  AlbumRequest.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

public class AlbumPosition: BaseMappable {
    public var position = PositionType.unspecified
    /// The item to which the position is relative to. This must be set only if using position type AFTER_MEDIA_ITEM or AFTER_ENRICHMENT_ITEM.
    /// Union field relative_item can be only one of the following
    public var relativeMediaItemId: String? { didSet {
        guard self.relativeMediaItemId != nil else { return }
        relativeEnrichmentItemId = nil
    }}
    public var relativeEnrichmentItemId: String? { didSet {
        guard self.relativeEnrichmentItemId != nil else { return }
        relativeMediaItemId = nil
    }}
    
    public override func mapping(map: Map) {
        position <- map["position"]
        relativeMediaItemId <- map["relativeMediaItemId"]
        relativeEnrichmentItemId <- map["relativeEnrichmentItemId"]
    }
    
    public enum PositionType: String, CaseIterable {
        /// Default value if this enum isn't set.
        case unspecified = "POSITION_TYPE_UNSPECIFIED"
        /// At the beginning of the album.
        case firstInAlbum = "FIRST_IN_ALBUM"
        /// At the end of the album.
        case lastInAlbum = "LAST_IN_ALBUM"
        /// After a media item.
        case afterMediaItem = "AFTER_MEDIA_ITEM"
        /// After an enrichment item.
        case afterEnrichmentItem = "AFTER_ENRICHMENT_ITEM"
    }
    
}

public class EnrichmentItem : BaseMappable {
    var id = ""
    
    public override func mapping(map: Map) {
        id <- map["id"]
    }
}

public class NewEnrichmentItem: BaseMappable {
    /// enrichment can be only one of the following
    public var textEnrichment: TextEnrichment? { didSet {
        guard self.textEnrichment != nil else { return }
        locationEnrichment = nil
        mapEnrichment = nil
    }}
    public var locationEnrichment: LocationEnrichment? { didSet {
        guard self.locationEnrichment != nil else { return }
        textEnrichment = nil
        mapEnrichment = nil
    }}
    public var mapEnrichment: MapEnrichment? { didSet {
        guard self.mapEnrichment != nil else { return }
        locationEnrichment = nil
        textEnrichment = nil
    }}
    
    public override func mapping(map: Map) {
        textEnrichment <- map["textEnrichment"]
        locationEnrichment <- map["locationEnrichment"]
        mapEnrichment <- map["mapEnrichment"]
    }
    
}

public class TextEnrichment : BaseMappable {
    
    var text = ""
    
    public override func mapping(map: Map) {
        text <- map["text"]
    }
    
}

public class LocationEnrichment : BaseMappable {
    
    var location: Location?
    
    public override func mapping(map: Map) {
        location <- map["location"]
    }
    
}

public class MapEnrichment : BaseMappable {
    
    var origin: Location?
    var destination: Location?
    
    public override func mapping(map: Map) {
        origin <- map["origin"]
        destination <- map["destination"]
    }
    
}

public class Location : BaseMappable {
    var locationName = ""
    var latlng: LatLng?
    
    public override func mapping(map: Map) {
        locationName <- map["locationName"]
        latlng <- map["latlng"]
    }
    
    public class LatLng : BaseMappable {
        var latitude: Double?
        var longitude: Double?
        
        public override func mapping(map: Map) {
            latitude <- map["latitude"]
            longitude <- map["longitude"]
        }
    }
}
