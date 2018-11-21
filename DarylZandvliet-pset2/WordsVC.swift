//
//  WordsVC.swift
//  DarylZandvliet-pset2
//
//  Created by Daryl Zandvliet on 20/11/2018.
//  Copyright © 2018 Daryl Zandvliet. All rights reserved.
//

import UIKit

class WordsVC: UIViewController {
    
    
    var story: Story!
    var chosenStory: String?
    var result: NSAttributedString?
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buildStory()
        updateLabel()
        updateTextSuggestion()
        // Do any additional setup after loading the view.
    }
    
    // create an instance of Story.
    
    func buildStory() {
        let storyPath = Bundle.main.path(forResource: chosenStory, ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        story = Story(withText: text)
        
  
 
    }
    
    // update the remaining number of words left
    
    func updateLabel() {
        let progressDescript = "\(story.remainingPlaceholders) word(s) left"
        progressLabel.text = progressDescript
    }

    
    // suggest what type of user input is requested
    func updateTextSuggestion() {
        textField.placeholder = "Fill in a/an \(story.nextPlaceholder ?? "") .."
    }
    
    
    // the function first checks if the user filled in a word
    // in the next step the function checks if we have some placeholders left
    // if not, it will segue to the resultscreen, otherwise we will continu filling in words.
    
    @IBAction func saveTextToVar(sender: UIButton) {
        
        if textField.text == ""{
            
            let alert = UIAlertController(title: "Please fill in a word", message: "You need to fill in a word to complete your story.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
           
        }
        
        else {
        
        if story.remainingPlaceholders < 2 {
            
            let userWord : String! = textField.text
            
            story.fillInPlaceholder(word: userWord)
            result = story.attributedText
            
            performSegue(withIdentifier: "showResultSegue", sender: self)
        }
        
        else {
        
        let userWord : String! = textField.text
            
        story.fillInPlaceholder(word: userWord)
        
        updateTextSuggestion()
            
        updateLabel()
        
        textField.text = ""
            
        }
        }

    }
    
    // pass the result to the final VC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendResult = segue.destination as! ResultVC
        sendResult.finalResult = result
    }

    
    
    
    
}
