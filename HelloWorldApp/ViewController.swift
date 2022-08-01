//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var redTrafficView: UIView!
    @IBOutlet var yellowTrafficView: UIView!
    @IBOutlet var greenTrafficView: UIView!
    
    @IBOutlet var controlColorButton: UIButton!
    
    private var countPressButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTrafficView.backgroundColor = .red
        redTrafficView.alpha = 0.5
        redTrafficView.layer.cornerRadius = redTrafficView.frame.height/2
        
        yellowTrafficView.backgroundColor = .yellow
        yellowTrafficView.alpha = 0.5
        yellowTrafficView.layer.cornerRadius = yellowTrafficView.frame.height/2
        
        greenTrafficView.backgroundColor = .green
        greenTrafficView.alpha = 0.5
        greenTrafficView.layer.cornerRadius = greenTrafficView.frame.height/2
        
       controlColorButton.configuration = setupButton(with: "START")
    }

    
    @IBAction func switchColorButton() {
        controlColorButton.configuration = setupButton(with: "NEXT")
        
        switch countPressButton {
        case 0:
            greenTrafficView.alpha = 0.5
            redTrafficView.alpha = 1
            countPressButton += 1
        case 1:
            redTrafficView.alpha = 0.5
            yellowTrafficView.alpha = 1
            countPressButton += 1
       default:
            yellowTrafficView.alpha = 0.5
            greenTrafficView.alpha = 1
            countPressButton = 0
        }
    }
    
    private func setupButton(with title: String) -> UIButton.Configuration {
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        buttonConfiguration.cornerStyle = .medium
        buttonConfiguration.title = title
        buttonConfiguration.buttonSize = .medium
        buttonConfiguration.attributedTitle?.font = .systemFont(ofSize: 25)
        
        return buttonConfiguration
    }
}

