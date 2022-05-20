//
//  GoogleButton.swift
//  GoodOnesTest
//
//  Created by Rohan Tyagi on 5/10/22.
//

import SwiftUI

struct GoogleButton: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Group {
            HStack(spacing: 10) {
                
                Image("Google")
                                
                Text("Continue with Google")
                           .foregroundColor(Color(UIColor().colorFromHex("#000000", 1)))
                               
            }
            .padding()
            .frame(width: width, height: height)

           
        }
        .background((Color(UIColor().colorFromHex("#FFFFFF", 1))))
    }
}

extension UIColor {
      
    func colorFromHex(_ hex: String,_ alpha: CGFloat) -> UIColor {
        var hexstring = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexstring.hasPrefix("#"){
            hexstring.remove(at: hexstring.startIndex)
        }
        
        if hexstring.count != 6{
            return UIColor.black
        }
        
        var rgb : UInt64 = 0
        Scanner(string: hexstring).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat((rgb & 0x0000FF)) / 255.0, alpha: alpha)
        
    }
}
