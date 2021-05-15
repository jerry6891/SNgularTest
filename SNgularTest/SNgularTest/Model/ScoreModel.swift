//
//  ScoreModel.swift
//  SNgularTest
//
//  Created by Jerry Lozano on 5/14/21.
//

import UIKit
import Foundation

class ScoreModel {
    
    // MARK: Properties
    fileprivate var correctAnswers: Int = 0
    fileprivate var inCorrectAnswers: Int = 0
    
    // MARK: Methods
    func reset() {
        correctAnswers = 0
        inCorrectAnswers = 0
    }
    
    func incrementCorrectAnswers() {
        correctAnswers += 1
    }
    
    func incrementInCorrectAnswers() {
        inCorrectAnswers += 1
    }
    
    func getQuestionsAsked() -> Int {
        return correctAnswers + inCorrectAnswers
    }
    
    func getScore() -> String {
        let iPercentile = Double(correctAnswers) / Double(getQuestionsAsked())
        
        if iPercentile > 0.70 {
            return "You have passed the test! \n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers."
        } else if iPercentile > 0.50 {
            return "OK... \n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers."
        } else {
            return "You have FAILED on the test! \n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers."
        }
    }
}
