//
//  ResultViewController.swift
//  Quiz
//
//  Created by administrator on 3/16/22.
//

import UIKit

class ResultViewController: UIViewController {

    var totalCorrectAnswers : Int = 0
    var totalAnswer : Int = 0
    
    
    @IBOutlet weak var lbltotalerros: UILabel!
    @IBOutlet weak var lbltotalacertos: UILabel!
    @IBOutlet weak var lbltotalquestions: UILabel!
    
    @IBOutlet weak var lblscore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbltotalacertos.text = "Perguntas corretas: \(totalCorrectAnswers)"
        lbltotalquestions.text = "Perguntas respondidas: \(totalAnswer)"
        
        lbltotalerros.text = "Perguntas erradas: \(totalAnswer - totalCorrectAnswers)"
        
        if totalCorrectAnswers > 0 {
            lblscore.text = "\(totalCorrectAnswers*100/totalAnswer)%"
        } else {
            lblscore.text = "0%"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Tela 2 - ira aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela 2 - apareceu")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela 2 - vai sumir")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Tela 2 - sumiu")
    }
    

    @IBAction func reiniciar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
