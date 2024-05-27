//
//  CurveView.swift
//  AwardAnimation
//
//  Created by Анна on 27.05.2024.
//

import SwiftUI

struct CurveView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let middleHeight = geometry.size.height / 2
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: 0, y: 0),
                    radius: middleHeight,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: width, y: 0),
                    radius: middleHeight,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: width, y: height),
                    radius: middleHeight,
                    startAngle: .degrees(270),
                    endAngle: .degrees(180),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: 0, y: height),
                    radius: middleHeight,
                    startAngle: .degrees(0),
                    endAngle: .degrees(270),
                    clockwise: true
                )
                path.closeSubpath()
                
            }
            .stroke(LinearGradient(
                colors: [.red, .purple, .blue],
                startPoint: UnitPoint(x: 0, y: 1),
                endPoint: UnitPoint(x: 1, y: 0)), lineWidth: width / 40)
            .blur(radius: 2.0)
        }
    }
}

#Preview {
    CurveView()
        .frame(width: 200, height: 300)
}
