//
//  GPhotosApi.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import Foundation
import Moya

public struct GPhotosApi {
    private init() {}
    
    internal static let plugins: [PluginType] = [
        NetworkLoggerPlugin(),
        AccessTokenPlugin(tokenClosure: { _ in return Strings.photosAccessToken })
    ]
    
    public static let mediaItems = MediaItems()
//    public static let albums = Albums()
//    public static let sharedAlbums = SharedAlbums()
}
