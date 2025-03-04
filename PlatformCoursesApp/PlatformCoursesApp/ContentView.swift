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
    @State var showCard = false
    @State var bottomState: CGSize = .zero
    @State var showFull = false

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )

            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(
                    .degrees(show ? 0 : 10)
                )
                .rotationEffect(
                    Angle(
                        degrees: showCard ? -10 : 0)
                    )
                .rotation3DEffect(
                    Angle(
                        degrees: showCard ? 0 : 10),
                        axis: (x: 10.0, y: 0, z: 0)
                    )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))

            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1: 0.95)
                .rotationEffect(
                    Angle.degrees(show ? 0 : 5)
                )
                .rotationEffect(
                    Angle(
                        degrees: showCard ? -5 : 0
                    )
                )
                .rotation3DEffect(
                    Angle(
                        degrees: showCard ? 0 : 5
                    ),
                    axis: (x: 10.0, y: 0, z: 0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))

            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(
                    .spring(
                        response: 0.3,
                        dampingFraction: 0.6,
                        blendDuration: 0
                    )
                )
                .onTapGesture {
                    showCard.toggle()
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
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(
                    .timingCurve(0.2, 0.8, 0.2, 1,
                                 duration: 0.8)
                    )
                .gesture(
                    DragGesture().onChanged { value in
                        bottomState = value.translation
                        if showFull {
                            bottomState.height += -280
                        }
                        if bottomState.height < -280 {
                            bottomState.height = -280
                        }
                    }
                    .onEnded { value in
                        if bottomState.height > 50 {
                            showCard = false
                        }
                        if (bottomState.height < -100 && !showFull) || (bottomState.height < -230 && showFull) {
                            bottomState.height = -280
                            showFull = true
                        } else {
                            bottomState = .zero
                            showFull = false
                        }
                    }
                )
        }
    }
}

#Preview {
    ContentView()
}
