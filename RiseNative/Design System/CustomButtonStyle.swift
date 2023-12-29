//
//  ButtonStyle.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

enum ButtonType{
    case primary , secondary
}
struct CustomButtonStyle: ButtonStyle {
    @Binding var type:ButtonType
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration : Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity , maxHeight: 54)
            .background(Rectangle().fill(type == .primary ? Color.riseTeal : Color.riseOffWhite)
                .cornerRadius(5))
            .foregroundStyle(type == .primary ? Color.white : Color.riseTeal)
            .font(.custom("DMSans-Bold", size: 15))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(isEnabled ? 1 : 0.5)
    }
}

