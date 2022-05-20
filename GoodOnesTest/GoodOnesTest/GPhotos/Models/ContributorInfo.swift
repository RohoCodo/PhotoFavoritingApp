//
//  ContributorInfo.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

public class ContributorInfo: BaseMappable {
    
    public var profilePictureBaseUrl: URL?
    public var displayName = ""
    
    public override func mapping(map: Map) {
        profilePictureBaseUrl <- (map["profilePictureBaseUrl"], URLTransform())
        displayName <- map["displayName"]
    }
    
}
