//
//  TitleView.swift
//  PlatformCourses
//
//  Created by Cesar Giupponi on 10/02/25.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

#Preview {
    TitleView()
}
