//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let login = "Jack"
    private let password = 123321
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        if let userName = userNameTF.text {
            welcomeVC.userName = userName
        }
    }
    
    @IBAction func logInButtonPressed() {
        
        guard userNameTF.text != login || passwordTF.text != String(password) else { return }
        
        let alert = UIAlertController (title: "Invalid login or password", message: "Please, enter correct login and password", preferredStyle: .alert)
        let okAction = UIAlertAction (title: "Ok", style: .cancel)
        alert.addAction(okAction)
        present (alert, animated: true)
        
        passwordTF.text = ""
    }
    
    @IBAction func forgotNameButtonPressed() {
        
        let alert = UIAlertController (title: "Oops!", message: "Your name is \(login) 😉", preferredStyle: .alert)
        let okAction = UIAlertAction (title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        
        let alert = UIAlertController(title: "Oops!", message: "Your Password \(password)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        passwordTF.text = ""
        userNameTF.text = ""
    }
}

