//
//  CardView.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import SwiftUI
import Photos

enum FavoriteDismiss: Int {
    case favorite, dismiss, none
}
struct CardView: View {
    @State private var translation: CGSize = .zero
    @State var pImage: PhotoImage
    @State private var swipeStatus: FavoriteDismiss = .none

    private var onRemove: (_ asset: PhotoImage) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    
    init(pImage: PhotoImage,  onRemove: @escaping (_ image: PhotoImage) -> Void) {
        self.pImage = pImage
        self.onRemove = onRemove
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                 ZStack(alignment: self.swipeStatus == .favorite ? .topLeading : .topTrailing){
                     if(pImage.im != nil){
                         Image(uiImage: pImage.im)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                            .clipped()
                     }
//                    Text("yes")
                    
                    if self.swipeStatus == .favorite {
                        Text("Favorite")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 3.0)
                        ).padding(24)
                            .rotationEffect(Angle.degrees(-45))
                    } else if self.swipeStatus == .dismiss {
                        Text("Dismiss")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 3.0)
                        ).padding(.top, 45)
                            .rotationEffect(Angle.degrees(45))
                    }
                }
                
//                HStack {
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text("\(self.user.firstName) \(self.user.lastName), \(self.user.age)")
//                            .font(.title)
//                            .bold()
//                        Text(self.user.occupation)
//                            .font(.subheadline)
//                            .bold()
//                        Text("\(self.user.mutualFriends) Mutual Friends")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//
//                    Image(systemName: "info.circle")
//                        .foregroundColor(.gray)
//                }
//                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
//                            self.status = .favorite
                            self.pImage.choice = .favorite
                            self.swipeStatus = .favorite
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.pImage.choice = .dismiss
                            self.swipeStatus = .dismiss
                            self.pImage.choice = self.swipeStatus
                        } else {
                            self.pImage.choice = .none
                            self.swipeStatus = .none
                            
                        }
                        
                }.onEnded { value in
                    // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.pImage)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
//        .onAppear(){
//            PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil) { (image,_) in
//                self.image = image
////                    .resizable()
////                    .scaledToFill()
////                    .frame(width: geom.size.width, height: geom.size.height * 0.75) // 3
////                    .clipped()
//            }
//        }
    }
}

// 7
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(pImage: PhotoImage(id: 0, im: UIImage.init(), choice: .none, ass: PHAsset.init()),
                 onRemove: { _ in
                    // do nothing
            })
            .frame(height: 400)
            .padding()
    }
}
