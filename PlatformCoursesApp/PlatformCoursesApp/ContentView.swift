//
//  ContentView.swift
//  PlatformCoursesApp
//
//  Created by Cesar Giupponi on 10/02/25.
//

import SwiftUI

struct ContentView: View {

    @State var show = false
    @State var viewState = CGSize.zero

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            BackCardView()
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))

            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle.degrees(show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))

            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(
                    .spring(
                        response: 0.3,
                        dampingFraction: 0.6,
                        blendDuration: 0
                    )
                )
                .onTapGesture {
                    show.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        viewState = value.translation
                        show = true
                    }
                    .onEnded { value in
                        viewState = .zero
                        show = false
                    }
                )

            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
        }
    }
}

#Preview {
    ContentView()
}
