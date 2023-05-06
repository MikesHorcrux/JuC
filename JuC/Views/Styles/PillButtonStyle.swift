//
//  PillButtonStyle.swift
//  JuC
//
//  Created by Mike on 5/3/23.
//

import SwiftUI

struct PillButtonStyle: ButtonStyle{
    var fillColor: Color = Color("OxfordBlue")
    var textColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.callout)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(fillColor)
            .foregroundColor(textColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct PillButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("testing") {
            
        }
        .buttonStyle(PillButtonStyle())
    }
}
