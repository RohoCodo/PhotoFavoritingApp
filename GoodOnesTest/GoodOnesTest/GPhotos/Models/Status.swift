//
//  Status.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import ObjectMapper

public class Status : BaseMappable {
    public var code: Int?
    public var message: String?
    
    override public func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
