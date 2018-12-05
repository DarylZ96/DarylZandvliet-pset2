//
//  QuestionVC
//  DarylZandvliet-pset2
//
//  Created by Daryl Zandvliet on 14/11/2018.
//  Copyright © 2018 Daryl Zandvliet. All rights reserved.
//

import UIKit

class StoryVC: UIViewController {
    
    //Outlet section
   
    @IBOutlet weak var topic: UIStackView!
    @IBOutlet weak var simpleButton: UIButton!
    @IBOutlet weak var tarzanButton: UIButton!
    @IBOutlet weak var universityButton: UIButton!
    @IBOutlet weak var dancingButton: UIButton!
    @IBOutlet weak var clothesButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    

    // Story names
    
    enum Stories: String {
        
    case simple = "madlib0_simple",
    
    tarzan = "madlib1_tarzan",
    
    university = "madlib2_university",
    
    clothes = "madlib3_clothes",
    
    dance = "madlib4_dance"
        
    }
    
    
    
    var storyChoice = ""
   
    // append the story names to the empty variable
    
    @IBAction func topicAnswerPressed(_ sender: UIButton) {
        switch sender {
            case simpleButton:
                storyChoice.append(Stories.simple.rawValue)
            case tarzanButton:
                storyChoice.append(Stories.tarzan.rawValue)
            case universityButton:
                storyChoice.append(Stories.university.rawValue)
            case dancingButton:
                storyChoice.append(Stories.dance.rawValue)
            case clothesButton:
                storyChoice.append(Stories.clothes.rawValue)
            default:
                break
            }
        
        performSegue(withIdentifier: "toWordSegue", sender: self)

    }

    // send the data to the WordsVC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiver = segue.destination as! WordsVC
        receiver.chosenStory = storyChoice
    }
    
    @IBAction func unwindToStory(segue: UIStoryboardSegue) {
        storyChoice = ""
    }
   

}
