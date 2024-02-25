//
//  ContentView.swift
//  Tabuada
//
//  Created by Vinicius Ledis on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameActive = false
    @State private var selectedTable = 2
    @State private var selectedQuestionCount = 5
    @State private var userAnswer = ""
    @State private var questionNumber = 0
    @State private var questions: [Question] = []
    
    
    var body: some View {
        NavigationStack {
            Spacer(minLength: 15)
            Form {
                Section {
                    Text("Qual tabuada deseja treinar ?")
                    Stepper("\(selectedTable)", value: $selectedTable, in: 2...12)
                }
                Section {
                    Text("Quantas perguntas deseja responder?")
                    Stepper("\(selectedQuestionCount)", value: $selectedQuestionCount, in: 5...15, step: 5)
                }
                Button("Começar!") {
                    generateQuestions()
                    isGameActive = true
                }
                if isGameActive {
                    GameView (
                        isGameActive: $isGameActive,
                        selectedTable: $selectedTable,
                        selectedQuestionCount: $selectedQuestionCount,
                        questions: $questions,
                        questionNumber: $questionNumber
                    )}
            }
            .navigationTitle("Tabuada Quizz")
            
        }
        
    }
    
   private func generateQuestions() {
        questions = (1...selectedQuestionCount).map { _ in
            let randomOperand = Int.random(in: 1...12)
            return Question(text: "\(selectedTable) x \(randomOperand)", answer: selectedTable * randomOperand)
        }
    }

}

#Preview {
    ContentView()
}
