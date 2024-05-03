//
//  RulesViewController.swift
//  demoStoryboard
//
//  Created by Nirmalsinh Rathod on 29/02/24.
//

import UIKit

class RulesViewController: UIViewController {
    
    // MARK: - Properties
    
    // Label to display the title
    let titleLabel = UILabel()
    
    // Label to display the rules
    let rulesLabel = UILabel()
    
    // Label to display the exercises
    let exerciseLabel = UILabel()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    // MARK: - UI Configuration
    
    // Configure the title label
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40,weight: .bold)
        titleLabel.textAlignment = .center
        
        // Constraints for the title label
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60), // Position from top
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:30), // Position from leading edge
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-30) // Position from trailing edge
        ])
    }
    
    // Configure the rules label
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rulesLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.textAlignment = .center
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        // Constraints for the rules label
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25), // Position below title label
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), // Position from leading edge
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), // Position from trailing edge
        ])
    }
    
    // Configure the exercise label
    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        exerciseLabel.text = "♠️ = Push-ups\n\n❤️ = Sit-up\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exerciseLabel.numberOfLines = 0
        
        // Constraints for the exercise label
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60), // Position below rules label
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200), // Fixed width
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) // Center horizontally
        ])
    }
    
}

