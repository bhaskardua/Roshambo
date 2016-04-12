//
//  ViewController.swift
//  Roshambo
//
//  Created by Bhaskar Dua on 10/4/16.
//  Copyright © 2016 Bhaskar Dua. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    enum Results {
        case PaperCoversRock, RockCrushesScissors, ScissorsCutsPaper, itsATie
    }
    
    enum Input: Int {
        case Paper, Rock, Scissors
    }
    
    
    
    var userInput: Input!
    var computerInput: Input!
    var result: Results!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentViewControllerWithCode(sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func presentViewControllerWithCodeAndSegue(sender: UIButton) {
        
        performSegueWithIdentifier("showResult", sender: self)
    }
    
    
    
    @IBAction func playGame(sender: UIButton) {
        
        switch sender.tag {
        case Input.Paper.rawValue:
            userInput = .Paper
        case Input.Rock.rawValue:
            userInput = .Rock
        case Input.Scissors.rawValue:
            userInput = .Scissors
        default:
            print("Erroneous button click")
        }
        
        computerInput = Input(rawValue: Int(arc4random_uniform(3)))
        
        switch (userInput!, computerInput!) {
        case (.Paper, .Paper), (.Rock, .Rock), (.Scissors, .Scissors):
            result = Results.itsATie
        case (.Paper, .Rock), (.Rock, .Paper):
            result = Results.PaperCoversRock
        case (.Rock, .Scissors), (.Scissors, .Rock):
            result = Results.RockCrushesScissors
        case (.Scissors, .Paper), (.Paper, .Scissors):
            result = Results.ScissorsCutsPaper
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult" {
            let resultVC = segue.destinationViewController as! ResultViewController
            let resultText: String
            let resultImage: UIImage
            
            switch result! {
            case Results.itsATie:
                resultText = "It's a tie"
                resultImage = UIImage(named: "itsATie")!
            case Results.PaperCoversRock:
                resultText = "Paper Covers Rock"
                resultImage = UIImage(named: "PaperCoversRock")!
            case Results.RockCrushesScissors:
                resultText = " Rock Crushes Scissors"
                resultImage = UIImage(named: "RockCrushesScissors")!
            case Results.ScissorsCutsPaper:
                resultText = "Scissors Cuts Paper"
                resultImage = UIImage(named: "ScissorsCutsPaper")!
            }

            resultVC.resultText = resultText
            resultVC.resultImage = resultImage
        }
    }
    
    
    
}

