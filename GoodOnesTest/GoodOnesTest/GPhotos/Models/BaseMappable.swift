//
//  BaseMappable.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

public class BaseMappable: Mappable {
    public init() {}
    
    required public init(map: Map) {
        mapping(map: map)
    }
    
    public func mapping(map: Map) {}
}
