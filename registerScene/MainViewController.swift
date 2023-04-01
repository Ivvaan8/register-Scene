

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotNameButton: UIButton!
    
    let userName = "Alex"
    let password = "1234"
    let okAction = UIAlertAction(title: "OK", style: .default)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 7
        passwordTF.delegate = self
        userNameTF.delegate = self
        forgotNameButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height / 60)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: view.frame.height / 60)



    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registerVC = segue.destination as? EndRegistrViewController else { return }
        registerVC.user = userNameTF.text

    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func createAlertAction() -> UIAlertAction {
        let deletePasswordAction = UIAlertAction(
            title: "OK",
            style: .cancel) { _ in
                self.passwordTF.text = ""
            }
        return deletePasswordAction
    }

    
    @IBAction func userNameButtonTapped() {
        createAlert(title: "Help", message: "Your name is \(userName)", action: okAction)
    }


    @IBAction func passwordButtonTapped() {
        createAlert(title: "Help", message: "Your password is \(password)", action: okAction)
    }


    
    
    @IBAction func loginButtonAction() {
        if userNameTF.text != userName || passwordTF.text != password {
            createAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                action: createAlertAction()
            )
        }
    }
}



extension MainViewController {
    private func createAlert(title: String, message: String, action: UIAlertAction) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(action)
        present(alert, animated: true)
    }
}


extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}




