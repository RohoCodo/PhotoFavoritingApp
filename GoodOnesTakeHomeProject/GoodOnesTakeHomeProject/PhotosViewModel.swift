//
//  PhotosViewModel.swift
//  GoodOnesTakeHome
//
//  Created by Rohan Tyagi on 5/8/22.
//

import Foundation
import SwiftUI
import Photos

class PhotosViewModel: ObservableObject, PHPhotoLibraryAvailabilityObserver{
    func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
        print("unavailable")
    }
    
    func isEqual(_ object: Any?) -> Bool {
        return true
    }
    
    var hash: Int = 0
    
    var superclass: AnyClass?
    
    func `self`() -> Self {
        return self
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        return true
        return Unmanaged.passRetained(PhotosViewModel.self)
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        return true
        return Unmanaged.passRetained(PhotosViewModel.self)
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        return true
        return Unmanaged.passRetained(PhotosViewModel.self)
    }
    
    func isProxy() -> Bool {
        return true
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        return true
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        return true
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        return true
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        return true
    }
    
    var description: String = ""
    
    
    var latestPhotoAssetsFetched: PHFetchResult<PHAsset>? = nil

    
    func fetchLatestPhotos(forCount count: Int?, d: DispatchGroup){
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { pA in
//            print(pA.rawValue)
            PHPhotoLibrary.shared().register(self)
//            print("warriors")
        }
        // Create fetch options.
        let options = PHFetchOptions()

        // If count limit is specified.
        if let count = count { options.fetchLimit = count }

//        options.for
        // Add sortDescriptor so the lastest photos will be returned.
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        options.sortDescriptors = [sortDescriptor]

        // Fetch the photos.
        self.latestPhotoAssetsFetched = PHAsset.fetchAssets(with: .image, options: options)
        d.leave()
    }
    
    
}
