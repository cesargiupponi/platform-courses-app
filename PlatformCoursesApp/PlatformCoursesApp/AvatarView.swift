//
//  AvatarView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 17/05/25.
//

import SwiftUI

struct AvatarView: View {

    @Binding var showProfile: Bool

    var body: some View {
        Button {
            showProfile.toggle()
        } label: {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

#Preview {
    AvatarView(showProfile: .constant(false))
}
