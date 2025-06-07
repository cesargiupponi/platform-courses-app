//
//  CourseListView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 06/06/25.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        VStack {
            CourseView()
        }
    }
}

struct CourseView: View {

    @State var show = false

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.white)
                    Text("20 Sections")
                        .foregroundStyle(Color.white.opacity(0.7))
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Logo1"))
            }
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Card2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30: 20)
        .padding(.top, show ? 30 : 0)
        .frame(width: show ? .infinity : screen.width - 60, height: show ? .infinity : 280)
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CourseListView()
}
