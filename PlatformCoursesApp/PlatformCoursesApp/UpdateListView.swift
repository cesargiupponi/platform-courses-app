//
//  UpdateListView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 17/05/25.
//

import SwiftUI

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1",
           title: "SwiftUI Advanced",
           text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.",
           date: "JAN 1"),
    Update(image: "Card2",
           title: "Webflow",
           text: "Design and animate a high converting landing page with advanced interactions, payments and CMS",
           date: "OCT 17"),
    Update(image: "Card3",
           title: "ProtoPie",
           text: "Quickly prototype advanced animations and interactions for mobile and web.",
           date: "AUG 27"),
    Update(image: "Card4",
           title: "SwiftUI",
           text: "Learn how to code custom UIs, animations, gestures and components in Xcode 16",
           date: "JUNE 11"),
    Update(image: "Card5",
           title: "Framer Playground",
           text: "Create powerful animations and intercations with the Framer X code editor",
           date: "JUNE 11")
]

struct UpdateListView: View {
    var body: some View {
        NavigationView {
            List(updateData) { updateItem in
                NavigationLink(destination: Text(updateItem.text)) {
                    HStack {
                        Image(updateItem.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)

                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(updateItem.title)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text(updateItem.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundStyle(Color.gray)
                            
                            Text(updateItem.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationBarTitle(Text("Updates"))
        }
    }
}

#Preview {
    UpdateListView()
}
