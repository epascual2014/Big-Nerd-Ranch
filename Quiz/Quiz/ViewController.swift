//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet var currentQuestionLabel : UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    
    let questions: [String] = ["From what is cognac made?", "What is 7 + 7?", "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex]
//        questionLabel.text = question
        currentQuestionLabel.text = question
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Label's initial alpha at 0
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        ++currentQuestionIndex
        
        if currentQuestionIndex == questions.count {
            
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        // Animate the label when user clicks next.
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    func animateLabelTransitions() {
        
        //Animate the alpha
        UIView.animateWithDuration(0.5, animations: {
//            self.questionLabel.alpha = 1
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1

        
        })
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations:  {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
        },
            completion:  { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)

        })
    
    }
   

}

