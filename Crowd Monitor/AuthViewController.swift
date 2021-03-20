//
//  AuthViewController.swift
//  Crowd Monitor
//
//  Created by Swamita on 20/03/21.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        textField.text = ""
        nameTextField.text = ""
    }

    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                textField.placeholder = "Enter Admin Code"
            case 1:
                textField.placeholder = "Enter Staff Code"
            default:
                break
            }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if nameTextField.text == ""  {
            messageLabel.alpha = 1
            messageLabel.text = "❌ Enter name!"
            UIView.animate(withDuration: 2) {
                self.messageLabel.alpha = 0
            }
        }
        
        else if textField.text == "" {
            messageLabel.alpha = 1
            messageLabel.text = "❌ Enter Code!"
            UIView.animate(withDuration: 2) {
                self.messageLabel.alpha = 0
            }
        }
        else if textField.text == "abc123" && nameTextField.text == "Yash"{
            performSegue(withIdentifier: "authToTab", sender: self)
        }
        else {
            messageLabel.alpha = 1
            messageLabel.text = "❌ Invalid Code!"
            UIView.animate(withDuration: 2) {
                self.messageLabel.alpha = 0
            }
        }
    }
    
}