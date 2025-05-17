//
//  HomeView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 05/03/25.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct HomeView: View {

    @State var showProfile = false
    @State var viewState: CGSize = .zero

    var body: some View {

        ZStack {

            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .ignoresSafeArea(edges: .all)

            HomeContentView(showProfile: $showProfile)
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 30,
                    style: .continuous
                )
            )
            .shadow(color: Color.black.opacity(0.2),
                    radius: 20,
                    x: 0,
                    y: 20
            )
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(
                Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0),
                axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .ignoresSafeArea(edges: .all)

            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(Animation.spring(response: 0.5,
                                            dampingFraction: 0.6,
                                            blendDuration: 0),
                           value: showProfile)
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        if viewState.height > 50 {
                            showProfile = false
                        }
                        viewState = .zero
                    }
                )
        }
    }
}

#Preview {
    HomeView()
}
