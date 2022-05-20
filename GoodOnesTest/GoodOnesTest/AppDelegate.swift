//
//  AppDelegate.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/10/22.
//

import Foundation
import UIKit
import GPhotos
import Photos
import SwiftUI
//
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        print("Your code here")
//        Config
        var config = Config()
        config.printLogs = false
        
        GPhotos.initialize(with: config)
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let gphotosHandled = GPhotos.continueAuthorizationFlow(with: url)
//        // other app links
        return gphotosHandled
    }
//
//
}
