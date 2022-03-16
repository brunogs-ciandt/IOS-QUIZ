//
//  QuizViewController.swift
//  Quiz
//
//  Created by administrator on 3/16/22.
//

import UIKit

class QuizViewController: UIViewController {

    let quizmanager = QuizManager()
    
    @IBOutlet var viewtimer: UIView!
    
    @IBOutlet weak var lblquestion: UILabel!
    
    @IBOutlet var btnoptions: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectoption(_ sender: UIButton) {
        let btnindex = btnoptions.index(of: sender)!
        quizmanager.validateanswer(btnindex)
        getnewquiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewtimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0,   options: .curveLinear) {
            self.viewtimer.frame.size.width = 0
        } completion: { success in
            self.showresults()
        }
        
        getnewquiz()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsegue = (segue.destination as! ResultViewController)
        resultsegue.totalcorrectanswers = quizmanager.totalCorrectAnswer
        resultsegue.totalanswer = quizmanager.totalAnswers
    }
    
    func getnewquiz() {
        quizmanager.refreshQuiz()
        lblquestion.text = quizmanager.question
        
        for i in 0..<quizmanager.options.count {
            let option = quizmanager.options[i]
            var btnoption = btnoptions[i]
            btnoption.setTitle(option, for: .normal)
        }
        
    }
    
    func showresults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

}
