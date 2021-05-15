//
//  QuestionModel.swift
//  SNgularTest
//
//  Created by Rex Karnufex on 5/14/21.
//

import UIKit
import GameKit

struct QuestionModel {
    
    // MARK: Data
    let questions = [
        Question(
            interrogative: "What is the capital of France?",
            answers: ["Madrid", "Paris", "Don't Know", "None"],
            correctAnswerIndex: 1),
        Question(
            interrogative: "What is the capital of England?",
             answers: ["London", "Paris", "Don't Know", "None"],
             correctAnswerIndex: 0),
        Question(
            interrogative: "What is the capital of USA?",
            answers: ["New York", "Washington", "Don't Know", "None"],
            correctAnswerIndex: 1),
        Question(
            interrogative: "What is the capital of Argentina?",
            answers: ["Buenos Aires", "Santiago", "Don't Know", "None"],
            correctAnswerIndex: 0),
        Question(
            interrogative: "What is the capital of Mexico?",
            answers: ["Montreal", "Mexico City", "Brazil", "Canada"],
            correctAnswerIndex: 1),
        Question(
            interrogative: "What is the capital of Italy?",
            answers: ["Rome", "Paris", "Don't Know", "None"],
            correctAnswerIndex: 0),
        Question(
            interrogative: "What is the capital of Los Angeles?",
            answers: ["Madrid", "LA is not a country", "Don't Know", "None"],
            correctAnswerIndex: 1),
        Question(
            interrogative: "What is the capital of Rusia?",
            answers: ["Madrid", "Moscow", "Don't Know", "None"],
            correctAnswerIndex: 1)
    ]
    
    // MARK: Property
    var previouslyUsedNumbers: [Int] = []
    
    // MARK: Get-Random-Question Method
    mutating func getRandomQuestion() -> Question {
        if previouslyUsedNumbers.count == questions.count {
            previouslyUsedNumbers = []
        }
        
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        while previouslyUsedNumbers.contains(randomNumber) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        
        previouslyUsedNumbers.append(randomNumber)
        return questions[randomNumber]
    }
    
}

// MARK: Question Class
class Question {
    
    fileprivate let interrogative: String
    fileprivate let answers: [String]
    fileprivate let correctAnswerIndex: Int
    
    init(interrogative: String, answers: [String], correctAnswerIndex: Int) {
        self.interrogative = interrogative
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func validateAnswer(to givenAnswer: String) -> Bool {
        return(givenAnswer == answers[correctAnswerIndex])
    }
    
    func getInterrogative() -> String {
        return interrogative
    }
    
    func getAnswer() -> String {
        return answers[correctAnswerIndex]
    }
    
    func getChoices() -> [String] {
        return answers
    }
    
    func getAnswerAt(index: Int) -> String {
        return answers[index]
    }
}
