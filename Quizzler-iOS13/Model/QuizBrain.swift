import Foundation
import UIKit


// Setting a constant and feeding it an array of questions in the structure stated in Question.swift
var viewController = ViewController()

struct QuizBrain {
    let quiz = [
        Question(q: "How does Harry manage to breathe underwater during the second task of the Triwizard Tournament?", a: ["He transfigures into a shark", "He kisses a mermaid", "He eats gillyweed", "He performs a bubble-head charm"], correctAnswer: "He eats gillyweed"),
        Question(q: "What is the name of Fred and George’s joke shop?", a: ["Weasley Joke Emporium", "Weasleys’ Wizard Wheezes", "Fred & George’s Wonder Emporium", "Zonko’s Joke Shop"], correctAnswer: "Weasleys’ Wizard Wheezes"),
        Question(q: "Which of these is NOT one of the Unforgivable Curses?", a: ["Cruciatus Curse", "Imperius Curse", "Sectumsempra", "Avada Kedavra"], correctAnswer: "Sectumsempra"),
        Question(q: "Who guards the entrance to the Gryffindor common room?", a: ["The Grey Lady", "The Fat Friar", "The Bloody Baron", "The Fat Lady"], correctAnswer: "The Fat Lady"),
        Question(q: "Who is NOT a member of the Order of the Phoenix?", a: ["Cornelius Fudge", "Mad-eye Moody", "Professor Snape", "Remus Lupin"], correctAnswer: "Cornelius Fudge"),
        Question(q: "What does the spell “Obliviate” do?", a: ["Destroys objects", "Sends someone to the nether realm", "Removes parts of someone’s memory", "Makes objects invisible"], correctAnswer: "Removes parts of someone’s memory"),
        Question(q: "The three kinds of balls used in Quidditch are Bludgers, Snitches, and…", a: ["Quaffles", "Wiffles", "Boccis", "Foozles"], correctAnswer: "Quaffles"),
        Question(q: "How many Weasley siblings are there?", a: ["5", "7", "10", "3"], correctAnswer: "7"),
        Question(q: "Where do Harry and Ron eventually find the missing flying Ford Anglia?", a: ["At the Ministry of Magic", "In the Forbidden Forest", "In the Room of Requirement", "Outside the Dursleys House"], correctAnswer: "In the Forbidden Forest"),
        Question(q: "What does Mrs. Weasley give Harry for Christmas every year?", a: ["Bertie Bott’s every flavour beans", "Chocolate frogs", "A fruit cake", "A new sweater"], correctAnswer: "A new sweater"),
        Question(q: "", a: ["", "", "", ""], correctAnswer:"")
    ]
    
    
    var questionNumber = 0
    var currentScore = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].ca {
            currentScore += 1
            return true
        } else {
            return false
        }
    }
    
    
    mutating func getScore() -> Int {
        return currentScore
    }
    
    
    mutating func nextQuestion() {
        if questionNumber < 10 {
            questionNumber += 1
        }
    }
    
    
    mutating func getQuestionText() -> String {
        
        if questionNumber == 10 {
        return "Your score is: \(currentScore) out of 10\n\nThanks for playing!"
        }
        
        return quiz[questionNumber].text
    }
    
    
    func getChoice(choiceNumber: Int) -> String {
        return quiz[questionNumber].answer[choiceNumber]
    }
    
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func resetQuiz() {
        questionNumber = 0
        currentScore = 0
    }
    
}
