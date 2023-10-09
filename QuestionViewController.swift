//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by user248619 on 10/5/23.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var questionProgressView: UISlider!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    
    @IBOutlet weak var singStackView: UIStackView!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton1: UIButton!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    
    @IBOutlet weak var rangedSliderProgress: UISlider!
    
    var questions : [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .mouse),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
            ]
        ),
        Question(
            text: "Which activity do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .mouse),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .dog)
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                Answer(text: "I don't like them", type: AnimalType.mouse),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
            ]
        )
    ]

    var questionIndex = 0
    var answerChosen : [Answer] = []
        

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        switch sender{
        case singleButton1:
            answerChosen.append(currentAnswer[0])
        case singleButton2:
            answerChosen.append(currentAnswer[1])
        case singleButton3:
            answerChosen.append(currentAnswer[2])
        case singleButton4:
            answerChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    @IBAction func multiAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswer[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswer[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswer[2])
        }
        if multiSwitch4.isOn{
            answerChosen.append(currentAnswer[3])
        }
        nextQuestion()
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, respone: answerChosen)
    }
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        let index = Int(round(rangedSliderProgress.value * Float(currentAnswer.count - 1)))
        answerChosen.append(currentAnswer[index])
        
        nextQuestion()
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }
        else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
        
    }
    
    func updateUI(){
        singStackView.isHidden = true;
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question#\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setValue(totalProgress, animated: true)
        
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswer)
            
        case .multiple:
            updateMultiStack(using: currentAnswer)
            
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
        
    }
    
    func updateSingleStack(using answers : [Answer]){
        singStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        
    }
    
    func updateMultiStack(using answers : [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers : [Answer]){
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
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
