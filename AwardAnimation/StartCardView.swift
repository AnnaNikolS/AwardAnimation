//
//  StartCardView.swift
//  AwardAnimation
//
//  Created by Анна on 27.05.2024.
//

import SwiftUI

struct StartCardView: View {
    var text: String
    var cardColor: Color
    var strokeColors: [Color]
    
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
            
                RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.black)
                    .frame(width: 190, height: 290)
            CurveView()
                .frame(width: 190, height: 290)
                
            Text(text)
                .frame(width: 170)
                .foregroundStyle(.white)
                .font(.title.bold())
                .lineLimit(6)
        }
    }
}

#Preview {
    StartCardView(text: "1", cardColor: .red, strokeColors: [.red, .purple, .blue])
}
