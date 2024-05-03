//
//  CWButton.swift
//  demoStoryboard
//
//  Created by Nirmalsinh Rathod on 29/02/24.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required  init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor,title: String,systemImageName: String)
    {
        super.init(frame:.zero)
        
        configuration = .tinted()
        configuration?.title = title
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }

    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19,weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
