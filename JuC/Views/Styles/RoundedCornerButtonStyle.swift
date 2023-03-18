//
//  RoundedCornerButtonStyle.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI

struct RoundedCornerButtonStyle: ButtonStyle {
    var fillColor: Color = Color("OxfordBlue")
    var textColor: Color = .white
    var cornerRadius: CGFloat = 15
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight: .bold))
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(width: 300, height: 50)
            .background(fillColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct Previews_RoundedCornerButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("testing") {
            
        }
        .buttonStyle(RoundedCornerButtonStyle())
    }
}
