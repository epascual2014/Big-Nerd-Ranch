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
        
        animateLabelTransitions()
        
    }
    
    func showAnswer(sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    func animateLabelTransitions() {
        
        let animationClosure = { () -> Void in
            
            self.questionLabel.alpha = 1
            
        }
        
        //Animate the alpha
        UIView.animateWithDuration(0.5, animations: animationClosure)
        
        UIView.animateWithDuration(0.5, animations: {
            self.questionLabel.alpha = 1
        })
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Label's initial alpha at 0
        questionLabel.alpha = 0
    }

}

