//
//  CardSelectionVC.swift
//  demoStoryboard
//
//  Created by Nirmalsinh Rathod on 29/02/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    // Connect with ImageView of StoryBoard Screen
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    //Set of Images
    var cards: [UIImage?] = Deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        timer.invalidate()
    }
    
    func startTimer(){
     
        timer = Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
   
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    // Add Action with Buttons
    @IBAction func stopButtonTap(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTap(_ sender: Any) {
        timer.invalidate()
        startTimer()
        
    }
}
