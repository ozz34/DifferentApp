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

    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    //MARK: Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: IBActions
    @IBAction func actionRedSlider() {
        setupValueLabel(for: redLabel, and: redSlider)
        redColorTF.text = redLabel.text
        mixColor()
    }
    @IBAction func actionGreenSlider() {
        setupValueLabel(for: greenLabel, and: greenSlider)
        greenColorTF.text = greenLabel.text
        mixColor()
    }
    @IBAction func actionBlueSlider() {
        setupValueLabel(for: blueLabel, and: blueSlider)
        blueColorTF.text = blueLabel.text
        mixColor()
    }
    
    @IBAction func returnDonePressed() {
        
        for textField in [redColorTF, greenColorTF, blueColorTF] {
            guard let newValue = textField?.text else { return }
            guard let numberValue = Float(newValue), 0...1 ~= numberValue else {
                getAlert(for: textField ?? redColorTF,
                         and: "Please in fill all the fields or enter correct value")
                return
            }
        }

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
        setValueSlider(for: slider)
        slider.minimumTrackTintColor = color
        label.text = "\(slider.value)"

    }
    
    private func setValueSlider(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: color)
        
        colorSliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = round(Float(ciColor.red)*100)/100
            case greenSlider: greenSlider.value = round(Float(ciColor.green)*100)/100
            default: blueSlider.value = round(Float(ciColor.blue)*100)/100
            }
        }
    }
    
    private func setupValueLabel(for label: UILabel, and slider: UISlider) {
        label.text = String(format: "%.2f", slider.value)
    }
    
    private func setupUI() {
        
        setupSlider(for: redSlider, and: .red, also: redLabel)
        setupSlider(for: greenSlider, and: .green, also: greenLabel)
        setupSlider(for: blueSlider, and: .blue, also: blueLabel)
        
        mixColorTextView.layer.cornerRadius = 10
        mixColorTextView.backgroundColor = color
        
        for colorTF in [redColorTF, greenColorTF, blueColorTF] {
            colorTF?.delegate = self
            
            redColorTF.placeholder = redLabel.text
            greenColorTF.placeholder = greenLabel.text
            blueColorTF.placeholder = blueLabel.text
            
      //  doButtonForToolBar()
        }
    }
       
    
    // можно в отдельном методе или как сделано сейчас в расширении
    
//    private func doButtonForToolBar() {
//
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
//                                            target: nil,
//                                            action: nil)
//        let doneButton = UIBarButtonItem(title: "Done",
//                                         style: .done,
//                                         target: self,
//                                         action: #selector(didTappedDone))
//
//        toolBar.items = [flexibleSpace, doneButton]
//
//        for colorTF in [redColorTF, greenColorTF, blueColorTF] {
//            colorTF?.inputAccessoryView = toolBar
//        }
//    }

    @objc private func didTappedDone() {
        view.endEditing(true)
//        for colorTF in [redColorTF, greenColorTF, blueColorTF] {
//            colorTF?.resignFirstResponder()

        }
    
    
    private func getAlert(for textField: UITextField, and message: String) {
        
        let alert = UIAlertController(title: "Wrong format",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        textField.text = ""
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue), 0...1 ~= numberValue else {
            getAlert(for: textField, and: "Please enter correct value")
            return
        }

        switch textField {
        case redColorTF:
            redLabel.text = newValue
            redSlider.value = numberValue
        case greenColorTF:
            greenLabel.text = newValue
            greenSlider.value = numberValue
        default:
            blueLabel.text = newValue
            blueSlider.value = numberValue
        }
        mixColor()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTappedDone))

        toolBar.items = [flexibleSpace, doneButton]
        textField.inputAccessoryView = toolBar
        }
}

