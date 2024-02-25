//
//  Game View.swift
//  Tabuada
//
//  Created by Vinicius Ledis on 15/02/2024.
//

import SwiftUI

struct GameView: View {
    @Binding var isGameActive: Bool
    @Binding var selectedTable: Int
    @Binding var selectedQuestionCount: Int
    @Binding var questions: [Question]
    @Binding var questionNumber: Int
    @State private var userAnswer = ""
    @State private var isAnswerCorrect = false
    @State private var score = 0
    

    var body: some View {
        VStack {
            Text("Question \(questionNumber + 1) of \(selectedQuestionCount)")
                .padding()
            
            Text(questions[questionNumber].text)
                .font(.largeTitle)
                .padding()

            TextField("Your Answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Pronto") {
                checkAnswer()
                userAnswer = ""
            }
            .padding()

            Spacer()

            if questionNumber == selectedQuestionCount - 1{
                Text("Você acertou \(score) de \(selectedQuestionCount) perguntas")
                    .padding()
                Button("Recomeçar") {
                    resetGame()
                }
                .padding()
            }
        }
        .padding()
    }

    private func startGame() {
        questionNumber = 0
    }

    private func checkAnswer() {
            guard let userAnswerInt = Int(userAnswer) else { return }
        if userAnswerInt == questions[questionNumber].answer {
            score += 1
        }

            if questionNumber < selectedQuestionCount - 1 {
                questionNumber += 1
            } else {
                isGameActive = false
            }
        }

//    private func calculateScore() -> Int {
//        var score = 0
//        for question in questions {
//            if question.isAnswerCorrect {
//                score += 1
//            }
//        }
//        return score
//    }

    private func resetGame() {
        userAnswer = ""
        questionNumber = 0
        isGameActive = true
    }
}


