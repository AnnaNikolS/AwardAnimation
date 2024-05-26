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
    
    var body: some View {
        ZStack {
                
            RoundedRectangle(cornerRadius: 22.5)
                .fill(
                    LinearGradient(
                        colors: strokeColors,
                        startPoint: UnitPoint(x: 0, y: 1),
                        endPoint: UnitPoint(x: 1, y: 0))
                )
                .frame(width: 200, height: 300)
            
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: cardColors,
                            startPoint: UnitPoint(x: 0, y: 1),
                            endPoint: UnitPoint(x: 1, y: 0))
                    )
                    .frame(width: 190, height: 290)
           
                
            Text(text)
        }
        
    }
}

#Preview {
    CardView(text: "1", cardColors: [.darkPurple, .myPurple, .lightPurple], strokeColors: [.white])
}
