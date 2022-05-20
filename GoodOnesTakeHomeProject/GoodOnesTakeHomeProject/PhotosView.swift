//
//  ContentView.swift
//  Shared
//
//  Created by Rohan Tyagi on 5/8/22.
//

import SwiftUI
import Photos

struct PhotosView: View {
    @ObservedObject var pVM: PhotosViewModel
    @State var photoAssets: [PHAsset] = []
    @State var pAssets: [PHAsset:Int] = [:]
    @State var d = DispatchGroup()
    
    
    init(){
        pVM = PhotosViewModel()
//        let d = DispatchGroup()
        d.enter()
//        requestAutho
        pVM.fetchLatestPhotos(forCount: 30, d: d)
        
    }
    
    func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(self.photoAssets.count - 1 - id) * 10
        }

    func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(self.photoAssets.count - 1 - id) * 10
            return geometry.size.width - offset
        }
    
     var maxID: Int {
        return self.pAssets.map { $0.value }.max() ?? 0
     }
    
    var body: some View {
        VStack{
            GeometryReader{ geom in
                VStack{
                    ZStack{
                        if(photoAssets.isEmpty != true){
                            ForEach(self.photoAssets, id: \.self) { pA in
                            if (self.maxID - 3)...self.maxID ~= self.pAssets[pA]! {
                            CardView(asset: pA)
                                .frame(width: 400, height: 400)
                                .offset(x: 0, y: self.getCardOffset(geom, id: 0))
                            }

                            }
//                            ForEach<[PHAsset], PHAsset, CardView>(self.photoAssets, id: \.self){ pA in
//                //                if(pA.)
//                                CardView(asset: pA)
//        //                            .animation(.spring())
//        //                            .frame(width: 400, height: 400)
//        //                            .offset(x: 0, y: self.getCardOffset(geom, id: self.pAssets[pA]!))
//                            }
                            
                ////            }
                //            CardView()
                        }
                
                
                    }
                }
            }
//        Text("Hello, world!")
//            .padding()
        }
        .onAppear(){
            d.notify(queue: .main){ [self] in
                for x in 0...29 {
        //            photoAssets.app
//                    print(pVM.latestPhotoAssetsFetched![x].description)
//                    print(photoAssets.endIndex)
    //                photoAssets[photoAssets.endIndex] = pVM.latestPhotoAssetsFetched![x]
                    self.photoAssets.append(pVM.latestPhotoAssetsFetched![x])
                    self.pAssets[pVM.latestPhotoAssetsFetched![x]] = x
    //                print(photoAssets[0])
    //                print(photoAssets.count)
                }
//                print(photoAssets.count)
            }
//            PHPhotoLibrary.shared().register(PHPhotoLibraryAvailabilityObserver)
//            pVM.latestPhotoAssetsFetched = pVM.fetchLatestPhotos(forCount: 30)
//            for x in 0...29 {
//    //            photoAssets.app
//                photoAssets.append(pVM.latestPhotoAssetsFetched![x])
//            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
