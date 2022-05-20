//
//  ContentView.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import SwiftUI
import Photos
import GoogleSignIn


var begDate = UserDefaults.standard.object(forKey: "begDate")
var endDate = UserDefaults.standard.object(forKey: "endDate")

struct ContentView: View {
/// List of users
    
    @ObservedObject var pVM: PhotosViewModel = PhotosViewModel()
    @ObservedObject var loginVM = GoogleLoginViewModel()
    @State var showIntroScreen = true
//    @State var photoAssets: [PHAsset] = []
//    @State var pAssets: [PHAsset:Int] = [:]
    @State var photoIDs: [UIImage:Int] = [:]
    @State var photos: [UIImage] = []
    @State var ps: [PhotoImage] = []
    @State var fetched: Bool = false
    @State var fetchedOnce: Bool = false
    
    
    @State var d = DispatchGroup()
    @State var dtwo = DispatchGroup()
    
    init(){
//        let d = DispatchGroup()
//        pVM.requestAuthor(d: dfirst)
//        d.notify(queue: .main){
//        d.enter()
        dtwo.enter()
    //        requestAutho
        pVM.fetchLatestPhotos(forCount: 30, d: d, dtwo: dtwo)
//        }
        
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(self.ps.count - 1 - id) * 10
        }

    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(self.ps.count - 1 - id) * 10
            return geometry.size.width - offset
        }

    private var maxID: Int {
        return self.ps.map { $0.id }.max() ?? 0
     }
    
var body: some View {
        VStack {
            GeometryReader { geometry in
LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8509803922, green: 0.6549019608, blue: 0.7803921569, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                    .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                VStack(spacing: 20) {
                    DateView()
                        ZStack {
                            if(ps.isEmpty != true){
                                if(self.fetched || ps.count == 30){
                                    ForEach(self.ps, id: \.self){ p in
                                        if (p.id > self.maxID - 4){
                                            CardView(pImage: p) { image in
                                                //if favorited signal favorited
                                                //if dismissed signal dismissed
                                                self.fetchedOnce = true
                                                let d = image.ass.creationDate!
                                                if((begDate as! Date) > d){
                                                    begDate = d
                                                    UserDefaults.standard.set(d, forKey: "begDate")
                                                    print("creation: \(d)")
                                                    print("begDate: \(begDate)")
                                                }
                                                if((endDate as! Date) < d){
                                                    endDate = d
                                                    UserDefaults.standard.set(d, forKey: "endDate")
                                                    print("endDate: \(endDate)")
                                                }
                                                self.ps.removeAll() {$0.id == image.id}
                                            }.animation(.spring())
                                            .frame(width: 300, height: 400)
                                            .offset(x: 0, y: self.getCardOffset(geometry, id: p.id))
                                        }
                                        
                                    }
                                }
                            }
                            else{
                                if(fetched){
                                    Text("You have finished choosing! Congrats!")
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 12, height: 12)
                                        .modifier(ParticlesModifier())
                                        .offset(x: -100, y : -50)
                                                
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 12, height: 12)
                                        .modifier(ParticlesModifier())
                                        .offset(x: 60, y : 70)
                                }
                            }
                            Spacer()
                        }
                    if(GPhotos.isAuthorized != true){
                        GoogleButton(width: 330, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                            .onTapGesture {
                                self.loginVM.socialLogin.attemptLoginGoogle()
                            }
                            .shadow(radius: 5)
                    }
                    else{
                        SignOutButton(width: 330, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                            .onTapGesture {
                                self.loginVM.socialLogin.attemptLogOut()
                            }
                            .shadow(radius: 5)
                            
                        
                    }
//Spacer()

                }.frame(width: UIScreen.main.bounds.width, alignment: Alignment.center)
            }
        }.padding()
        .onAppear(){
            self.fetchedOnce = false
            self.fetched = false
            dtwo.notify(queue: .main){ [self] in
                print("contentview")
                
                for x in 0...29 {
//                    PHImageRequestOptions.phima
                    if(GPhotos.isAuthorized){
                        GPhotos.logout()
                    }
                    let itemOptions = PHImageRequestOptions()
                    itemOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
                    itemOptions.isNetworkAccessAllowed = true
//                    itemOptions
                    
                    PHImageManager.default().requestImage(for: pVM.latestPhotoAssetsFetched![x], targetSize: CGSize(width: pVM.latestPhotoAssetsFetched![x].pixelWidth, height: pVM.latestPhotoAssetsFetched![x].pixelHeight), contentMode: .aspectFit, options: itemOptions) { (image,_) in
                        print("\(x): \(image.debugDescription)")
                        if(image != nil){
//                            image?.accessibilityIdentifier
                            self.photos.append(image!)
                            self.photoIDs[image!] = x
                            self.ps.append(PhotoImage(id: x, im: image!, choice: .none, ass: pVM.latestPhotoAssetsFetched![x]))
                            if(x == 29){
//                                ps.sorted(by: { $0.id < $1.id })
                                self.fetched = true
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showIntroScreen) {
            IntroScreen(showWelcomeScreen: $showIntroScreen)
        }
    
    }
}
struct DateView: View {
    var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(Date.now, format: .dateTime.day().month().year())
                            .font(.title)
                            .bold()
                        Text("Today")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                                    }
//                    Spacer()
                }.padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
