//
//  SectionView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 17/05/25.
//

import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

struct SectionView: View {

    var section: Section

    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }

            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)

            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

#Preview {

    let section = Section(title: "Prototype designs in SwiftUI",
                          text: "18 sections",
                          logo: "Logo1",
                          image: Image(uiImage: #imageLiteral(resourceName: "Card2")),
                          color: Color(#colorLiteral(red: 0.4156862745, green: 0.2862745098, blue: 0.9490196078, alpha: 1)))

    SectionView(section: section)
}
