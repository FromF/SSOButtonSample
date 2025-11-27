//
//  ContentView.swift
//  SSOButtonSample
//
//  Created by 藤治仁 on 2025/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            AppleLogoOnlySignInButton {
                
            }
            
            AppleLogoOnlyRoundedRectButton {
                
            }
            
            SigninWithGoogleButton {
                
            }
            
            PhoneSignInButton {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
