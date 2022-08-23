//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

final class SettingsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet var mixColorTextView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var BlueValueTF: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    //MARK: IBActions
    @IBAction func actionRedSlider() {
        setupValueLabel(for: redLabel, and: redSlider)
        mixColor()
    }
    @IBAction func actionGreenSlider() {
        setupValueLabel(for: greenLabel, and: greenSlider)
        mixColor()
    }
    @IBAction func actionBlueSlider() {
        setupValueLabel(for: blueLabel, and: blueSlider)
        mixColor()
    }
    
    @IBAction func returnDonePressed() {
        delegate.setupBackground(for: mixColorTextView.backgroundColor ?? .white)
       
        dismiss(animated: true)
    }
    
    // MARK: Private methods

    private func mixColor() {
        mixColorTextView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                                   green: CGFloat(greenSlider.value),
                                                   blue: CGFloat(blueSlider.value),
                                                   alpha: 1)
    }
    
    private func setupSlider(for slider: UISlider,
                             and color: UIColor,
                             also label: UILabel ) {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 1
        slider.minimumTrackTintColor = color
        label.text = "\(slider.value)"

    }
    
    private func setupValueLabel(for label: UILabel, and slider: UISlider) {
    label.text = "\(round(slider.value * 100)/100)"
    }
    
    private func setupUI() {
        
        setupSlider(for: redSlider, and: .red, also: redLabel)
        setupSlider(for: greenSlider, and: .green, also: greenLabel)
        setupSlider(for: blueSlider, and: .blue, also: blueLabel)
        
        mixColorTextView.layer.cornerRadius = 10
        mixColorTextView.backgroundColor = color
    }
}
