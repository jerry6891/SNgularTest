//
//  ViewController.swift
//  SNgularTest
//
//  Created by Jerry Lozano on 5/14/21.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    var iQuestions = QuestionModel()
    let iScore = ScoreModel()
    let numberOfQuestionPerRound = 5
    var currentQuestion: Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Methods
    func isGameOver() -> Bool {
        return iScore.getQuestionsAsked() >= numberOfQuestionPerRound
    }
    
    func displayQuestion() {
        currentQuestion = iQuestions.getRandomQuestion()
        if let question = currentQuestion {
            let choices = question.getChoices()
            
            questionLabel.text = question.getInterrogative()
            choiceOne.setTitle(choices[0], for: .normal)
            choiceTwo.setTitle(choices[1], for: .normal)
            choiceThree.setTitle(choices[2], for: .normal)
            choiceFour.setTitle(choices[3], for: .normal)
            
            if iScore.getQuestionsAsked() == numberOfQuestionPerRound - 1 {
                nextQuestionButton.setTitle("End Quiz", for: .normal)
            } else {
                nextQuestionButton.setTitle("Next Question", for: .normal)
            }
        }
        
        choiceOne.isEnabled = true
        choiceTwo.isEnabled = true
        choiceThree.isEnabled = true
        choiceFour.isEnabled = true
        
        choiceOne.isHidden = false
        choiceTwo.isHidden = false
        choiceThree.isHidden = false
        choiceFour.isHidden = false
        responseLabel.isHidden = true
        
        nextQuestionButton.isEnabled = false
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        if let question = currentQuestion,
           let answer = sender.titleLabel?.text {
            
            if question.validateAnswer(to: answer) {
                iScore.incrementCorrectAnswers()
                responseLabel.textColor = UIColor(red:0.15, green:0.61, blue:0.61, alpha:1.0)
                responseLabel.text = "Correct!"
            } else {
                iScore.incrementInCorrectAnswers()
                responseLabel.textColor = UIColor(red:0.82, green:0.40, blue:0.26, alpha:1.0)
                responseLabel.text = "Incorrect!"
            }
            
            choiceOne.isEnabled = false
            choiceTwo.isEnabled = false
            choiceThree.isEnabled = false
            choiceFour.isEnabled = false
            nextQuestionButton.isEnabled = true
            
            responseLabel.isHidden = false
        }
    }
    
    @IBAction func tapNextQuestion(_ sender: Any) {
        if isGameOver() {
            displayScore()
        } else {
            displayQuestion()
        }
    }
    
    func displayScore() {
        questionLabel.text = iScore.getScore()
        iScore.reset()
        nextQuestionButton.setTitle("Play Again!", for: .normal)
        
        responseLabel.isHidden = true
        choiceOne.isHidden = true
        choiceTwo.isHidden = true
        choiceThree.isHidden = true
        choiceFour.isHidden = true
    }
}
