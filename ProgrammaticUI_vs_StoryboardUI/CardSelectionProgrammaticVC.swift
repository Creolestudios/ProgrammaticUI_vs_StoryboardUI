//
//  CardSelectionProgrammaticVC.swift
//  demoStoryboard
//
//  Created by Nirmalsinh Rathod on 29/02/24.
//

import UIKit

class CardSelectionProgrammaticVC: UIViewController {
    
    // MARK: - Properties
    
    // Image view to display the card
    let cardImageView = UIImageView()
    
    // Buttons for controlling the card selection
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Restart", systemImageName: "arrow.clockwise.circle")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    // Array to store the deck of cards
    var cards = Deck.allValues
    
    // Timer for automatic card selection
    var timer: Timer!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    // MARK: - Timer Methods
    
    // Start the timer for automatic card selection
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    // Show a random card image
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    // Stop the timer
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    // Reset the timer
    @objc func resetTimer(){
        stopTimer()
        startTimer()
    }
    
    // MARK: - UI Configuration
    
    // Configure the user interface
    func configureUI(){
        configureCardImageView()
        configureStartButton()
        configureResetButton()
        configureRulesButton()
    }
    
    // Configure the card image view
    func configureCardImageView(){
        // Add the card image view to the view hierarchy
        view.addSubview(cardImageView)

        // Disable autoresizing mask translation to constraints
        cardImageView.translatesAutoresizingMaskIntoConstraints = false

        // Set default image for the card image view
        cardImageView.image = UIImage(named: "AS")

        // Activate constraints for the card image view
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250), // Set width constraint
            cardImageView.heightAnchor.constraint(equalToConstant: 350), // Set height constraint
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75) // Position vertically with an offset
        ])
        
    }
    
    // Configure the start/stop button
    
    func configureStartButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    // Configure the reset button
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    // Configure the rules button
    func configureRulesButton(){
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Button Actions
    
    // Present the rules view controller
    @objc func presentRulesVC() {
        /* If we want to pass Data then we can use this syntax and pass rulesVC
         let rulesVC = RulesViewController()
         rulesVC.color = .red
         */
        
        present(RulesViewController(), animated: true)
        
//        and if we want to full Screen view then we can use this Syntax
//        navigationController?.pushViewController(RulesViewController(), animated: true)
    }
}

