//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    let questions: [String] = ["From what is cognac made?", "What is 7+7?", "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[currentQuestionIndex]
        
    }
    
    func showNextQuestion(sender: AnyObject) {
        ++currentQuestionIndex
        
        if currentQuestionIndex == questions.count {
            
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }
    
    func showAnswer(sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }

}

