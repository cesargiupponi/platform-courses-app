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
    @State var showContent: Bool = false

    var body: some View {

        ZStack {

            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .ignoresSafeArea(edges: .all)

            HomeContentView(showProfile: $showProfile,
                            showContent: $showContent)
            .padding(.top, 44)
            .background(
                VStack {
                    LinearGradient(colors: [Color("background2"),
                                            Color.white],
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .frame(height: 200)
                    Spacer()
                }
                .background(Color.white)
            )
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

            if showContent {
                Color.white.ignoresSafeArea(.all)
                ContentView()

                VStack {
                    HStack {
                        Spacer()

                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundStyle(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6,
                                   dampingFraction: 0.6,
                                   blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
