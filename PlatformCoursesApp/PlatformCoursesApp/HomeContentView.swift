//
//  HomeContentView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 17/05/25.
//

import SwiftUI

let sectionData = [
    Section(title: "Prototype designs in SwiftUI",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card4")),
            color: Color(#colorLiteral(red: 0.4156862745, green: 0.2862745098, blue: 0.9490196078, alpha: 1))),
    Section(title: "Build a SwiftUI app",
            text: "20 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Background1")),
            color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Section(title: "SwiftUI Advanced",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card2")),
            color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
]

struct HomeContentView: View {

    @Binding var showProfile: Bool
    @State var showUpdate = false

    var body: some View {
        VStack {
            HStack {

                Text("Watching")
                    .font(.system(size: 28, weight: .bold))

                Spacer()

                AvatarView(showProfile: $showProfile)

                Button(action: {
                    self.showUpdate.toggle()
                }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                }
                .sheet(isPresented: $showUpdate) {
                    ContentView()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                    axis: (x: 0, y: 10, z: 0)
                                )
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }

            Spacer()
        }
    }
}

#Preview {
    HomeContentView(showProfile: .constant(false))
}
