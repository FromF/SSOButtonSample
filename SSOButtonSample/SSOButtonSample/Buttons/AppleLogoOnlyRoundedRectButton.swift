//
//  AppleLogoOnlyRoundedRectButton.swift
//  SSOButtonSample
//
//  Created by 藤治仁 on 2025/11/26.
//

import SwiftUI

struct AppleLogoOnlyRoundedRectButton: View {
    var width: CGFloat = 52
    var height: CGFloat = 52
    var cornerRadius: CGFloat = 12
    var action: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // 背景
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(backgroundColor)
                
                // Apple ロゴ（HIG では配布アセット推奨。ここでは SF Symbols で代替）
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFit()
                    // quiet zone のためロゴサイズは控えめ
                    .frame(width: width * 0.45, height: height * 0.45)
                    .foregroundColor(foregroundColor)
            }
        }
        .frame(width: width, height: height)
        .buttonStyle(.plain)
        .accessibilityLabel("Appleでサインイン")
        .accessibilityAddTraits(.isButton)
    }
    
    private var backgroundColor: Color {
        // HIG: ライト背景では「黒地＋白ロゴ」
        //      ダーク背景では「白地＋黒ロゴ」
        colorScheme == .light ? .black : .white
    }
    
    private var foregroundColor: Color {
        colorScheme == .light ? .white : .black
    }
}

#Preview {
    AppleLogoOnlyRoundedRectButton {
        
    }
}
