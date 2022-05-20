//
//  GoogleLoginViewModel.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/10/22.
//

import Foundation
import SwiftUI
import UIKit
import GoogleSignIn
import Firebase
import Photos
import GTMAppAuth
import AppAuth
import Alamofire


class GoogleLoginViewModel: ObservableObject {
    
    @State var socialLogin = SocialLogin()
    struct SocialLogin: UIViewRepresentable {
        @State var medias : Data? = nil
        
        init(){
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "MediaFetch"), object: nil, queue: .main) { [self] (Notification) in
                print("object: \(type(of: Notification.object))")
                self.medias = Notification.object as! Data
                print(self.medias)
            }
        }


        func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
            return UIView()
        }

        func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
            
        }
        
        func attemptLogOut(){
            GPhotos.logout()
        }

        func attemptLoginGoogle() {
//            login = true
//            signUp = false
            
            FirebaseApp.configure()
            GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
//            GIDSignIn.sharedInstance().clientID = "316515302994-298ujpabfoere2hd5si8h7phm4d5eu78.apps.googleusercontent.com"
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
            GIDSignIn.sharedInstance()?.signIn()
//            GIDSignIn.sharedInstance().clientID = "316515302994-298ujpabfoere2hd5si8h7phm4d5eu78.apps.googleusercontent.com"
//            AuthScope.
//            GPhotosResource.scopes.read
//            let scopes = Set(arrayLiteral: AuthScope.readOnly)
            let scopes = Set([AuthScope.readAndAppend])
//            print("tokenbefore: \(Strings.photosAccessToken)")
//            AF.request("https://accounts.google.com/o/oauth2/v2/auth", method: .get, parameters: AuthReq(),
//                       encoder: JSONParameterEncoder.default)
//                .response { data in
//                    print("data: \(data)")
//                }
            GPhotos.authorize(with: scopes) { boo, err in
                if let err = err {
                    print(err)
                }
                print("BOOL: \(boo) and \(GPhotos.isAuthorized)")

                if(GPhotos.isAuthorized){
                    print("here autho")
//                    print(GTMAppAuthFetcherAuthorization.
//                    GTMAppAuthFetcherAuthorization
//                    GPhotos.refreshToken()
//
                    print("token: \(Strings.photosAccessToken)")
//                          fromKeychain(forName: Strings.keychainName))

                    print("token1: \(GPhotosApi.plugins[1])")
                    
//                    Strings.keychainName
                    
                    AF.request("https://photoslibrary.googleapis.com/v1/mediaItems", method: .get, parameters: MediaItemParams(pageToken: Strings.photosAccessToken)).response { data in
                        print("data:\(data)")
                        
//                        data.
                    }
                    //this is where the token does not work
                    
                    GPhotosApi.mediaItems.list { medias in
                        print("medias \(self.medias)")
//                        let photos = self.medias.filter{$0.mediaMetadata?.photo != nil}
//                        print("count \(photos.count)")
                    }
                    
                    

                }
//                GPhotosApi.init()
//                GPhotosApi.mediaItems.get(id: "String") { photo in
//                    print("photo \(photo)")
////                    photosLibraryContents
////                    PhotosLibrary
////                    GPhotos/=
//                }
//                GPhotosApi.mediaItems.
            }
            
            
//            GIDSignIn.sharedInstance().scopes =
            
//            GIDSignIn
//            GIDGoogleUser.

        }

    }
    
    struct AuthReq: Encodable {
        let client_id: String = "316515302994-298ujpabfoere2hd5si8h7phm4d5eu78.apps.googleusercontent.com"
        let redirect_uri: String = "com.googleusercontent.apps.316515302994-298ujpabfoere2hd5si8h7phm4d5eu78"
        let response_type = "code"
        let scope = "photos"
    }
    struct MediaItemParams: Encodable {
        let pageSize: Int = 30
        let pageToken: String
    }
    
}
