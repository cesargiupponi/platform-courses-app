//
//  BottomCardView.swift
//  PlatformCourses
//
//  Created by Cesar Giupponi on 10/02/25.
//

import SwiftUI

struct BottomCardView: View {

    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Cesar Giupponi has achieved the UI Design course.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)

            HStack(spacing: 20.0) {
                RingView(show: $show,
                         colorOne: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                         colorTwo: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),
                         width: 88,
                         height: 88,
                         percent: 78
                )
                .animation(Animation.easeInOut.delay(0.3))
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("12 of 12 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2),
                        radius: 20,
                        x: 0,
                        y: 10
                )
            }

            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

#Preview {
    BottomCardView(show: .constant(true))
}
