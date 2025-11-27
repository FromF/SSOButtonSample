//
//  AppleLogoOnlySignInButton.swift
//  SSOButtonSample
//
//  Created by 藤治仁 on 2025/11/26.
//

import SwiftUI

/// Sign in with Apple の「ロゴのみカスタムボタン」サンプル
struct AppleLogoOnlySignInButton: View {
    /// ボタンの一辺（円の直径）
    var size: CGFloat = 44
    /// タップ時の処理
    var action: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // 背景（HIG の例にある円形コンテナ想定）
                Circle()
                    .fill(backgroundColor)
                
                // Apple ロゴ（本番は配布アセット推奨。ここでは SF Symbols）
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFit()
                    // ロゴまわりに “クワイエットゾーン” を確保するイメージで
                    .frame(width: size * 0.5, height: size * 0.5)
                    .foregroundColor(foregroundColor)
            }
        }
        .frame(width: size, height: size)
        .shadow(radius: 0) // 必要に応じて影は調整
        .buttonStyle(.plain) // デフォルトの青ハイライトを消す
        .accessibilityLabel("Appleでサインイン")
        .accessibilityAddTraits(.isButton)
    }
    
    private var backgroundColor: Color {
        // HIG に近いイメージ：
        // ・ライトモード：黒地に白ロゴ
        // ・ダークモード：白地に黒ロゴ
        colorScheme == .light ? .black : .white
    }
    
    private var foregroundColor: Color {
        colorScheme == .light ? .white : .black
    }
}

#Preview {
    AppleLogoOnlySignInButton {
        
    }
}
