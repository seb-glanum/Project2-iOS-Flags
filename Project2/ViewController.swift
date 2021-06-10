//
//  ViewController.swift
//  Project2
//
//  Created by iMac on 09/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestions = 10
    var countQuestions = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "us", "uk"]
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countQuestions += 1
        if(countQuestions != numberOfQuestions){
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            Button1.setImage(UIImage(named: countries[0]), for: .normal)
            Button2.setImage(UIImage(named: countries[1]), for: .normal)
            Button3.setImage(UIImage(named: countries[2]), for: .normal)
            title = "\(countries[correctAnswer].uppercased()): Score \(score)"
        }
        else {
            let ac = UIAlertController(title: "Congratulations", message: "The game is over, go away !", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            
            present(ac, animated: true)
        }
    }
    
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }
        else {
            title = "WRONG"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score) " + title == "WRONG" ? "The answer was \(countries[sender.tag].uppercased())" : "", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
}

