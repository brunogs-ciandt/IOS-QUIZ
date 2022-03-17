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
        let btnindex = btnoptions.firstIndex(of: sender)!
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
        print("Tela 1 - ira aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela 1 - apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela 1 - vai sumir")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Tela 1 - sumiu")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsegue = (segue.destination as! ResultViewController)
        resultsegue.totalCorrectAnswers = quizmanager.totalCorrectAnswer
        resultsegue.totalAnswer = quizmanager.totalAnswers
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
