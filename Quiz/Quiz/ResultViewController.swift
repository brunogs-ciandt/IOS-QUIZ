//
//  ResultViewController.swift
//  Quiz
//
//  Created by administrator on 3/16/22.
//

import UIKit

class ResultViewController: UIViewController {

    var totalcorrectanswers : Int = 0
    var totalanswer : Int = 0
    
    
    @IBOutlet weak var lbltotalerros: UILabel!
    @IBOutlet weak var lbltotalacertos: UILabel!
    @IBOutlet weak var lbltotalquestions: UILabel!
    
    @IBOutlet weak var lblscore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbltotalacertos.text = "Perguntas corretas: \(totalcorrectanswers)"
        lbltotalquestions.text = "Perguntas respondidas: \(totalanswer)"
        
        lbltotalerros.text = "Perguntas erradas: \(totalanswer - totalcorrectanswers)"
        lblscore.text = "\(totalcorrectanswers*100/totalanswer)"
    }
    

    @IBAction func reiniciar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
