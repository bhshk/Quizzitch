//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Abhishek Hegde on 6/5/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let ca: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        ca = correctAnswer
   }
}
