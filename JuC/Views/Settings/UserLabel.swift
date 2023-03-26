//
//  UserLabel.swift
//  JuC
//
//  Created by Mike on 3/19/23.
//

import SwiftUI

struct UserLabel: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(width: 22, height: 22)
                .background(Color("Platinum"))
                .clipShape(Circle())
               
            Text("Hey, Human")
                .foregroundColor(.white)
                .font(.callout)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color("OxfordBlue"))
        .clipShape(Capsule())
    }
}

struct UserLabel_Previews: PreviewProvider {
    static var previews: some View {
        UserLabel()
    }
}
