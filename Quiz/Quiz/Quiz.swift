//
//  Quiz.swift
//  Quiz
//
//  Created by administrator on 3/16/22.
//

import Foundation

class Quiz {
    
    let question: String;
    let options : [String]
    private let correctAnswer: String
    
    init( question: String,options : [String],correctAnswer: String){
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    func validateoption(_ index:Int) -> Bool {
        let option = options[index]
        return option == correctAnswer
    }
    
    deinit {
        print("liberou o quiz da memoria")
    }
}
