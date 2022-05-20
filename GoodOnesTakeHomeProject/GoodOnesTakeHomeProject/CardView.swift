//
//  CardView.swift
//  GoodOnesTakeHome
//
//  Created by Rohan Tyagi on 5/8/22.
//

import Foundation
import SwiftUI
import Photos


struct CardView: View {
    var asset: PHAsset
    @State var image: UIImage? = nil
    @State var size: CGSize? = nil
//    @State var translation: CGSize = .zero
//    let count: Int
//    let id: Int
    
//    private var onRemove: () -> Void
//    private var thresholdPercentage: CGFloat = 0.5
    
//    init(onRemove: @escaping () -> Bool){
//        self.onRemove = onRemove
//    }
    
//    func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
//            gesture.translation.width / geometry.size.width
//        }
//    func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        return  CGFloat(self.count - 1 - id) * 10
//        }
//    
//    func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        let offset: CGFloat = CGFloat(self.count - 1 - id) * 10
//            return geometry.size.width - offset
//        }
    
    var body: some View {
        
        GeometryReader { geom in
            if(image != nil){
                VStack{
                    Image(uiImage: image!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geom.size.width, height: geom.size.height * 0.75) // 3
                        .clipped()
                    
                    
                }.padding(.bottom)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .onAppear(){
                        size = geom.size
                    }
//                    .rotationEffect(.degrees(Double(self.translation.width / geom.size.width) * 25), anchor: .bottom)
//                    .animation(.interactiveSpring())
//                    .offset(x: self.translation.width, y: 0)
//                    .gesture(
//                                    // 3
//                        DragGesture()
//                            // 4
//                            .onChanged { value in
//                                self.translation = value.translation
//                            }.onEnded { value in
//                                if abs(self.getGesturePercentage(geom, from: value)) > self.thresholdPercentage {
////                                    self.onRemove()
//                                } else {
//                                    self.translation = .zero
//                                }
//                            }
//                    )
//                    .animatioxn(.spring())
 
            }
            
        }.onAppear(){
            PHImageManager.default().requestImage(for: asset, targetSize: size ?? CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil) { (image,_) in
                self.image = image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: geom.size.width, height: geom.size.height * 0.75) // 3
//                    .clipped()
            }
        }
    }
    
    
    
    
    
}

