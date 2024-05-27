//
//  CardView.swift
//  AwardAnimation
//
//  Created by Анна on 26.05.2024.
//

import SwiftUI

struct CardView: View {
    var text: String
    var cardColors: [Color]
    var strokeColors: [Color]
    var blur: Double
    var stroke: Double
    var trigger: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(
                    LinearGradient(
                        colors: strokeColors,
                        startPoint: UnitPoint(x: 0, y: 1),
                        endPoint: UnitPoint(x: 1, y: 0))
                )
                .frame(width: 200, height: 300)
                .blur(radius: blur)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: cardColors,
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0))
                        )
                        .frame(width: 190, height: 290)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: stroke).blur(radius: 0.5))
                
            }
                            
            CustomTextView(text: text, trigger: trigger)
                .frame(width: 170)
                .foregroundStyle(.white)
                .font(.title.bold())
                .lineLimit(6)
        }
    }
}

#Preview {
    CardView(text: "1", cardColors: [.red, .purple, .blue], strokeColors: [.red, .purple, .blue], blur: 3.0, stroke: 0.5, trigger: false)
        .frame(width: 200, height: 300)
}
