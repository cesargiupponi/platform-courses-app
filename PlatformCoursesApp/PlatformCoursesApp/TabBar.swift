//
//  TabBar.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 31/05/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("Home",
                systemImage: "play.circle.fill") {
                HomeView()
            }
            Tab("Certificates",
                systemImage: "rectangle.stack.fill") {
                ContentView()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    TabBar()
}
