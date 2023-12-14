//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Gold System on 13/12/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnswered.text =  "Perguntas Respondidas: \(totalAnswers)"
        lbCorrect.text =  "Perguntas Corretas: \(totalCorrectAnswers)"
        lbWrong.text =  "Perguntas Erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers*100/totalAnswers
        lbScore.text = "\(score)%"
    }
    

    @IBAction func close(_ sender: UIButton) {
        
        dismiss(animated: true,completion: nil)
    }
    
}
