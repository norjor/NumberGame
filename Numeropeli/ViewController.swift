//
//  ViewController.swift
//  Numeropeli
//
//  Created by Koulutus on 05/12/15.
//  Copyright © 2015 Koulutus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var MyIULabelInfo: UILabel!
    
    @IBOutlet weak var SubLabel: UILabel!
    
    @IBOutlet weak var MyUITextFieldShowNumber: UITextField!
    
    var Guesses : Int = 0;
    var MyGuess : Int = 0;
    
    @IBAction func MyUITextFieldInputNumber(sender: UITextField) {
        sender.resignFirstResponder()
        
        if (sender.text != nil) {
        
            let YourGuessAsString : String = sender.text!;
            Guesses++;

            let YourGuess = Int(YourGuessAsString)!;
            
            switch YourGuess
            {
                
            case 1...10:
                
                if (MyGuess < YourGuess)
                {
                    SubLabel.text = "Give smaller than " + YourGuessAsString;
                }
                else if (MyGuess > YourGuess)
                {
                    SubLabel.text = "Give bigger than " + YourGuessAsString;
                }
                else
                {
                    let GuessesAsStr = String(Guesses);
                    MyIULabelInfo.text = YourGuessAsString + " is right!";
                    SubLabel.text = "You guessed " + GuessesAsStr + " times";
                    Guesses = 0;
                }

                break;
                
            default:
                
                SubLabel.text = "Give a number between 1-10"
                MyUITextFieldShowNumber.text = ""
                
                break;
            }
        }
    }
    @IBAction func MyUIButtonStart(sender: UIButton) {
        MyIULabelInfo.text = "Number Guessing Game"
        SubLabel.text = "Give a number between 1-10"
        MyUITextFieldShowNumber.text = ""
        MyGuess = Int(arc4random_uniform(10)) + 1;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        MyUITextFieldShowNumber.endEditing(true)
        MyUITextFieldShowNumber.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

