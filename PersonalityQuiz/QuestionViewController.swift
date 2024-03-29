//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Ibrahim Syed on 2023-03-09.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var multipleStackViews: UIStackView!
    
    
    @IBOutlet var questionLabel: UILabel!
        
        @IBOutlet var singleStackView: UIStackView!
        @IBOutlet var singleButton1: UIButton!
        @IBOutlet var singleButton2: UIButton!
        @IBOutlet var singleButton3: UIButton!
        @IBOutlet var singleButton4: UIButton!
        
        @IBOutlet var multipleStackView: UIStackView!
        @IBOutlet var multiLabel1: UILabel!
        @IBOutlet var multiLabel2: UILabel!
        @IBOutlet var multiLabel3: UILabel!
        @IBOutlet var multiLabel4: UILabel!
        
        @IBOutlet var rangedStackView: UIStackView!
        @IBOutlet var rangedLabel1: UILabel!
        @IBOutlet var rangedLabel2: UILabel!
        
        @IBOutlet var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                          ]
                 
                 ),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
                    ]
                 ),
        Question(
            text: "Which activities do you enjoy?",
            type: .range,
            answers:  [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barley notice them", type: .turtle),
                Answer(text: "I love them", type: .dog)
            ]
            
        )
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
               multipleStackView.isHidden = true
               rangedStackView.isHidden = true
               
               
               let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
        Float(questions.count)
               
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)

        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .range:
            updateRangedStack(using: currentAnswers)
        
        }
              
        
    
        func updateSingleStack(using answers: [Answer]) {
                  singleStackView.isHidden = false
                  singleButton1.setTitle(answers[0].text, for: .normal)
                  singleButton2.setTitle(answers[1].text, for: .normal)
                  singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
            
            

      }
        
        
        
        func updateMultipleStack(using answers: [Answer]) {
                  multipleStackView.isHidden = false
                  multiLabel1.text = answers[0].text
                  multiLabel2.text = answers[1].text
                  multiLabel3.text = answers[2].text
                  multiLabel4.text = answers[3].text

      }
        
        func updateRangedStack(using answers: [Answer]) {
                  rangedStackView.isHidden = false
                  rangedLabel1.text = answers.first?.text
                  rangedLabel2.text = answers.last?.text

       }
        
        

       var answersChosen: [Answer] = []
     
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
