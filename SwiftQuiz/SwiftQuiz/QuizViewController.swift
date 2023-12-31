//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Gold System on 13/12/23.
//

import UIKit

class QuizViewController: UIViewController {

   
    @IBOutlet weak var viTimer: UIView!
    
    
    @IBOutlet weak var lbQuestion: UILabel!
    
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0,options: .curveLinear,animations:{
            self.viTimer.frame.size.width = 0
        }){(sucess) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    @IBAction func selectAnswers(_ sender: UIButton) {
        
        let index = btAnswers.index(of:sender)!
        quizManager.validateAnswers(index: index)
        getNewQuiz()
    }
    
    func getNewQuiz(){
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count{
            let option  = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    
}
