//
//  FeatureFilter.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//


import Foundation
import ObjectMapper

public class FeatureFilter : BaseMappable {
    public var includedFeatures = [Feature]()
    
    public override func mapping(map: Map) {
        includedFeatures <- map["includedFeatures"]
    }
    
    public enum Feature: String, CaseIterable {
        /// Treated as if no filters are applied. All features are included.
        case none = "NONE"
        /// Media items that the user has marked as favorites in the Google Photos app.
        case favorites = "FAVORITES"
    }

}
