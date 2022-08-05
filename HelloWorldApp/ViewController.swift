//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mixColorTextView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
    }
    
    @IBAction func actionRedSlider() {
        redLabel.text = "Red: \(round(redSlider.value * 100)/100)"
        mixColor()
    }
    
    @IBAction func actionGreenSlider() {
        greenLabel.text = "Green: \(round(greenSlider.value * 100)/100)"
        mixColor()
    }
    
    @IBAction func actionBlueSlider() {
        blueLabel.text = "Blue: \(round(blueSlider.value * 100)/100)"
        mixColor()
    }
    
// MARK: Private methods
    
    private func setupRedSlider() {
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.75
        redSlider.minimumTrackTintColor = .red
        redLabel.text = "Red: \(redSlider.value)"
    }
    
    private func setupGreenSlider() {
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.3
        greenSlider.minimumTrackTintColor = .green
        greenLabel.text = "Green: \(greenSlider.value)"
    }
    
    private func setupBlueSlider() {
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.5
        blueSlider.minimumTrackTintColor = .blue
        blueLabel.text = "Blue: \(blueSlider.value)"
    }
    
    private func mixColor() {
        
        mixColorTextView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                   green: CGFloat(greenSlider.value),
                                                   blue: CGFloat(blueSlider.value),
                                                   alpha: 0.8)
    }
}

