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
//    @State var dfirst = DispatchGroup()
    
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

    func requestAuthor(d: DispatchGroup){
//        d.enter()
        if(PHPhotoLibrary.authorizationStatus(for: .readWrite) != PHAuthorizationStatus.authorized){
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { pA in
                //            print(pA.rawValue)
    //            while(pA != .authorized){
    //                print("unauthorized")
                PHPhotoLibrary.shared().register(self)
    //            }
    //            PHPhotoLibrary.on
    //            if(pA == )
                
    //            print("warriors")
                if(pA == PHAuthorizationStatus.authorized){
                    
                    d.leave()
                }
            }
            
        }
        if(PHPhotoLibrary.authorizationStatus(for: .readWrite) == PHAuthorizationStatus.authorized){
            d.leave()
        }
        
        
    }
    
    func fetchLatestPhotos(forCount count: Int?, d: DispatchGroup, dtwo: DispatchGroup){
//        PHPhotoLibrary.requestAuthorization(for: .readWrite) { pA in
////            print(pA.rawValue)
//            PHPhotoLibrary.shared().register(self)
            print("warriors")
//        }
        d.enter()
        self.requestAuthor(d: d)
        d.notify(queue: .main){
//            dtwo.enter()
            print("made it here")
            
            let options = PHFetchOptions()
    //        options.observationInfo.creat
            // If count limit is specified.
    //        options
            if let count = count { options.fetchLimit = count }

            // Add sortDescriptor so the lastest photos will be returned.
            let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
            options.sortDescriptors = [sortDescriptor]
            print("dates are now: \(begDate) and \(endDate)")
            if(begDate != nil && endDate != nil){
                options.predicate = NSPredicate(format: "creationDate < %@ || creationDate > %@", begDate as! NSDate, endDate as! NSDate)
            }
            else{
                if(begDate == nil){
                    begDate = Date.init(timeIntervalSinceNow:0)
                }
                if(endDate == nil){
                    endDate = Date(timeIntervalSince1970: 1)
                }
                UserDefaults.standard.set(begDate, forKey: "begDate")
                UserDefaults.standard.set(endDate, forKey: "endDate")
                print("dates are now not nil: \(begDate) and \(endDate)")
            }
    //        options.predicate = NSPredicate(value: false)
            
            //save the earliest
            // Fetch the photos.
            self.latestPhotoAssetsFetched = PHAsset.fetchAssets(with: .image, options: options)
            dtwo.leave()
        }
        // Create fetch options.
    }
    
    
}
