

import UIKit

// Connecting all UI elements to code
class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var choice4Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var testResultImage: UIImageView!
    
    @IBAction func resetButton(_ sender: UIButton) {
        choice1Button.alpha = 1
        choice2Button.alpha = 1
        choice3Button.alpha = 1
        choice4Button.alpha = 1
        scoreLabel.alpha = 1
        testResultImage.alpha = 0
        quizBrain.resetQuiz()
        updateUI()
    }
    
    var quizBrain = QuizBrain()
    
    // When loaded, show an empty progress bar and show the first question using updateUI() function
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
    }
    
    // When either True or False button is pressed, check if the answer is correct against database of questions.
    // Then, show the next question by going to the next element in the array. Concurrently, further the progress bar.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // Overlaying green/red color over answer button to give users feedback
        if userGotItRight {
            UIView.animate(withDuration: 0.2) {
                sender.backgroundColor = UIColor.green
                sender.backgroundColor = UIColor.clear }
        } else {
            UIView.animate(withDuration: 0.2) {
                sender.backgroundColor = UIColor.red
                sender.backgroundColor = UIColor.clear }
        }
        
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        choice1Button.setTitle(quizBrain.getChoice(choiceNumber: 0), for: .normal)
        choice2Button.setTitle(quizBrain.getChoice(choiceNumber: 1), for: .normal)
        choice3Button.setTitle(quizBrain.getChoice(choiceNumber: 2), for: .normal)
        choice4Button.setTitle(quizBrain.getChoice(choiceNumber: 3), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        if quizBrain.questionNumber == 10 {
            choice1Button.alpha = 0
            choice2Button.alpha = 0
            choice3Button.alpha = 0
            choice4Button.alpha = 0
            scoreLabel.alpha = 0
            
            if quizBrain.currentScore > 5{
                testResultImage.alpha = 1
                testResultImage.image = #imageLiteral(resourceName: "Hermione")
            } else if quizBrain.currentScore <= 5 {
                testResultImage.alpha = 1
                testResultImage.image = #imageLiteral(resourceName: "Ron")
            }
        }
    }
}
