//
//  Question.swift
//  Personality Quiz
//
//  Created by user248619 on 10/5/23.
//

import Foundation

struct Question{
    var text: String
    var type: ResponseType
    var answers : [Answer]
}

enum ResponseType{
    case single, multiple, ranged
}


struct Answer{
    var text: String
    var type: AnimalType
}

enum AnimalType : Character{
    case dog = "🐶", mouse = "🐭", rabbit = "🐰", turtle = "🐢"
    
    var definition : String{
        switch self {
        case .dog:
            return "You are incredible outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .mouse:
            return "Michivious, yet mild-tempered, you enjoy doing things with your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on details. Slow and steady wins the race."
        }
        
    }

}



