//
//  SkeletonLoaderView.swift
//  RiseNative
//
//  Created by kehinde on 05/01/2024.
//

import SwiftUI

struct SkeletonLoaderView: View {
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.gray.opacity(0.2)
                    .cornerRadius(20)
                
                Color.white
                    .mask(
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .gray.opacity(0.5), .clear]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .rotationEffect(.degrees(360), anchor: .leading)
                            .offset(x: -geometry.size.width / 2)
                            .animation(.default.repeatForever(), value: isAnimating )
                    )
            }
            .onAppear {
            isAnimating = true
            }
        }
    }
}

#Preview {
    SkeletonLoaderView()
}
