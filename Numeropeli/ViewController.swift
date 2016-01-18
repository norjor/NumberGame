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
                    MyIULabelInfo.text = "Anna pienempi kuin " + YourGuessAsString;
                }
                else if (MyGuess > YourGuess)
                {
                    MyIULabelInfo.text = "Anna suurempi kuin " + YourGuessAsString;
                }
                else
                {
                    let GuessesAsStr = String(Guesses);
                    MyIULabelInfo.text = YourGuessAsString + " on oikein\n\nArvasit " +
                        GuessesAsStr + " kertaa";
                    Guesses = 0;
                }

                break;
                
            default:
                
                MyIULabelInfo.text = "Anna numero väliltä 1-10"
                MyUITextFieldShowNumber.text = ""
                
                break;
            }
        }
    }
    @IBAction func MyUIButtonStart(sender: UIButton) {
        MyIULabelInfo.text = "Anna numero väliltä 1-10"
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

