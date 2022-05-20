//
//  IntroScreen.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/11/22.
//

import SwiftUI

struct IntroScreen: View {
    @Binding var showWelcomeScreen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to GoodOnes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 48)
            Spacer()
            
            VStack(spacing: 24) {
                FeatureCell(image: "favorite", title: "Favorite Photos", subtitle: "Swipe right on a photo to favorite it.", color: .green)
                
                FeatureCell(image: "dismiss", title: "Dismiss", subtitle: "Swipe left on a photo to dismiss it.", color: .blue)
                
                FeatureCell(image: "Google", title: "Sign in to Google", subtitle: "Use your Google photos on GoodOnes", color: .red)
            }
            .padding(.leading)
            
            Spacer()
            Spacer()
            
            Button(action: { self.showWelcomeScreen = false }) {
                HStack {
                    Spacer()
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(15)
        }
        .padding()
    }
}

import SwiftUI

struct FeatureCell: View {
    var image: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 24) {
//            Image(ui)
            Image(image)
//                UIApplicationShortcutIcon.init(systemImageName: image))
//            Image(systemName: image)
//                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(color)
                    
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct FeatureCell_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCell(image: "text.badge.checkmark", title: "Title", subtitle: "Subtitle", color: .blue)
    }
}


struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen(showWelcomeScreen: .constant(true))
    }
}
