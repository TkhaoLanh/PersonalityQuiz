//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by user248619 on 10/5/23.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    
    var respone : [Answer]
    
     init?(coder : NSCoder, respone : [Answer]){
        self.respone = respone
        super.init(coder: coder)
    }
    
    required init?(coder : NSCoder){
        fatalError("init (coder) has not been implemented.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult(){
        let frequecyOfAnswer = respone.reduce(into: [:]){
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
        let frequetAnswerSorted = frequecyOfAnswer.sorted(by: {
            (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequetAnswerSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
