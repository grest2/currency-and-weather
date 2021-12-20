//
//  RoundedViewWrapper.swift
//  currency-and-weather
//
//  Created by iOS Developer on 12/20/21.
//

import SwiftUI

struct RoundedViewWrapper: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.textColor
                                    .opacity(0.3),lineWidth: 3)
                        .padding(.horizontal,12))
    }
}


