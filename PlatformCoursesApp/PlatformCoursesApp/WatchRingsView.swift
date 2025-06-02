//
//  WatchRingsView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 02/06/25.
//

import SwiftUI

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12) {
                RingView(show: .constant(true),
                         colorOne: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
                         colorTwo: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),
                         width: 44,
                         height: 44,
                         percent: 68)
                VStack(alignment: .leading, spacing: 4) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 min today")
                        .modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20,
                                        style: .continuous))
            .modifier(ShadowModifier())

            HStack(spacing: 12) {
                RingView(show: .constant(true),
                         colorOne: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
                         colorTwo: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),
                         width: 32,
                         height: 32,
                         percent: 54)
            }
            .padding(8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20,
                                        style: .continuous))
            .modifier(ShadowModifier())

            HStack(spacing: 12) {
                RingView(show: .constant(true),
                         colorOne: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
                         colorTwo: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
                         width: 32,
                         height: 32,
                         percent: 54)
            }
            .padding(8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20,
                                        style: .continuous))
            .modifier(ShadowModifier())


        }
    }
}

#Preview {
    WatchRingsView()
}
