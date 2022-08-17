//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Иван Худяков on 25.07.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: Private properties
    private let login = "a"
    private let password = "a"
    
    
    //MARK: Override function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }
        guard let userName = userNameTF.text else { return }
        
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = userName
            } else if let navigationVC = viewController as? UINavigationController {
                navigationVC.topViewController?.title = userNameTF.text
            }
        }
    }

    
    //MARK: @IBActions
    @IBAction func logInButtonPressed() {
        guard userNameTF.text != login || passwordTF.text != String(password) else { return }
        
        doAlert(title: "Invalid login or password",
                message: "Please, enter correct login and password")
        
        passwordTF.text = ""
    }
    
    @IBAction func forgotNameButtonPressed() {
        doAlert(title: "Oops!",message: "Your name is \(login)😉")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        doAlert(title: "Oops!",message: "Your Password \(password)")
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        passwordTF.text = ""
        userNameTF.text = ""
    }
    
    //MARK: Private function
    private func doAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

