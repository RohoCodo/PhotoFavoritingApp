//
//  Photos.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper
import UIKit

public class Photo: BaseMappable {
    
    public var cameraMake = ""
    public var cameraModel = ""
    public var focalLength = 0
    public var apertureFNumber = 0
    public var isoEquivalent = 0
    public var exposureTime = ""
    
    public override func mapping(map: Map) {
        cameraMake <- map["cameraMake"]
        cameraModel <- map["cameraModel"]
        focalLength <- map["focalLength"]
        apertureFNumber <- map["apertureFNumber"]
        isoEquivalent <- map["isoEquivalent"]
        exposureTime <- map["exposureTime"]
    }
}
