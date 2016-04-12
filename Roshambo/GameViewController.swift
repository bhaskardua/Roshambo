//
//  ViewController.swift
//  Roshambo
//
//  Created by Bhaskar Dua on 10/4/16.
//  Copyright © 2016 Bhaskar Dua. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

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

}

