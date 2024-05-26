//
//  ContentView.swift
//  AwardAnimation
//
//  Created by Анна on 26.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isFlipped = false
    @State var value = false
    
    var body: some View {
        ZStack {
            
           
//            isFlipped ? Color.purple.ignoresSafeArea() : Color.yellow.ignoresSafeArea()
            
            CardView(
                text: "Second",
                cardColors: [.darkPurple, .myPurple, .lightPurple],
                strokeColors: [.lightTwoPurple, .lightPurple, .darkPurple, .lightPurple, .lightTwoPurple, .lightPurple])
                .rotation3DEffect(
                    .degrees(isFlipped ? -360 : 360),
                                          axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .scaleEffect(isFlipped ? 1.3 : 0)
                .animation(
                    isFlipped ? .linear.delay(0.6).speed(0.5)
                              : .linear.speed(0.5),
                    value: isFlipped)
                
            
            
            CardView(
                text: "First",
                cardColors: [.red, .yellow],
                strokeColors: [.white, .gray, .white, .gray])
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
                
            }
        }
    }
}

#Preview {
    ContentView()
        
}
