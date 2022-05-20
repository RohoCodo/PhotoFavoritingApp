//
//  SignOutButton.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/12/22.
//

import SwiftUI

struct SignOutButton: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Group {
            HStack(spacing: 10) {
                
                Image("Google")
                                
                Text("Sign out of Google")
                           .foregroundColor(Color(UIColor().colorFromHex("#000000", 1)))
                               
            }
            .padding()
            .frame(width: width, height: height)

           
        }
        .background((Color(UIColor().colorFromHex("#FFFFFF", 1))))
    }
}
