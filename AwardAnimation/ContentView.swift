//
//  ContentView.swift
//  AwardAnimation
//
//  Created by Анна on 26.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isFlipped = false
    @State private var value = false
    @State private var trigger = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                CardView(
                    text: "Module four is finished! \n \nSwiftUI",
                    cardColors: [.red, .purple, .blue],
                    strokeColors: [.red, .purple, .blue],
                    blur: 15.0,
                    stroke: 0.5,
                    trigger: trigger)
                .rotation3DEffect(
                    .degrees(isFlipped ? -360 : 360),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .scaleEffect(isFlipped ? 1.3 : 0)
                .animation(
                    isFlipped ? .linear.delay(0.6).speed(0.5)
                    : .linear.speed(0.5),
                    value: isFlipped)
       
                StartCardView(
                    text: "Click to open the award!",
                    cardColor: .black,
                    strokeColors: [.red, .purple, .blue]
                )
                .rotation3DEffect(
                    .degrees(isFlipped ? -360 : 360),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .scaleEffect(isFlipped ? 0 : 1)
                .animation(
                    isFlipped ? .linear.speed(0.5)
                              : .linear.delay(0.6).speed(0.5),
                    value: isFlipped)
            }
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isFlipped.toggle()
                    trigger.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
    
}
