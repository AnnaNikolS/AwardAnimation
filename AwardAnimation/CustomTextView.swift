//
//  CustomTextView.swift
//  AwardAnimation
//
//  Created by Анна on 27.05.2024.
//

import SwiftUI

struct CustomTextView: View {
    var text: String
    var trigger: Bool
    var transition: ContentTransition = .interpolate
    var duration: CGFloat = 6.0
    var speed: CGFloat = 0.1
    
    @State private var animatedText = ""
    @State private var randomCharacters: [Character] = {
       let string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890-?/#$%@!^&*()="
        return Array(string)
    }()
    
    var body: some View {
        Text(animatedText)
            .fontDesign(.monospaced)
            .truncationMode(.tail)
            .contentTransition(transition)
            .animation(.easeInOut(duration: 0.1), value: animatedText)
            .onAppear {
                guard animatedText.isEmpty else { return }
                setRandomCharacters()
                animateText()
            }
            .customOnChange(value: trigger) { newValue in
                animateText()
            }
    }
    
    private func animateText() {
        for index in text.indices {
            let delay = CGFloat.random(in: 0...duration)
            let timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { _ in
                guard let randomCharacter = randomCharacters.randomElement() else { return }
                replaceCharacter(at: index, character: randomCharacter)
            }
            timer.fire()
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                if text.indices.contains(index) {
                    let actualCharacter = text[index]
                    replaceCharacter(at: index, character: actualCharacter)
                }
                timer.invalidate()
            }
        }
    }
    
    private func setRandomCharacters() {
        animatedText = text
        for index in animatedText.indices {
            guard let randomCharacter = randomCharacters.randomElement() else { return }
            replaceCharacter(at: index, character: randomCharacter)
        }
    }
    
    func replaceCharacter(at index: String.Index, character: Character) {
        guard animatedText.indices.contains(index) else { return }
        let indexCharacter = String(animatedText[index])
        
        if indexCharacter.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            animatedText.replaceSubrange(index...index, with: String(character))
        }
    }
}

fileprivate extension View {
    @ViewBuilder
    func customOnChange<T: Equatable>(value: T, result: @escaping (T) -> ()) -> some View {
        if #available(iOS 17, *) {
            self.onChange(of: value) { oldValue, newValue in
                result(newValue)
            }
        } else {
            self.onChange(of: value, perform: { value in
                result(value)
            })
        }
    }
}

#Preview {
    CustomTextView(text: "Hello!", trigger: true)
}
