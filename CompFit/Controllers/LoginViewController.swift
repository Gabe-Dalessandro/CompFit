//
//  LoginViewController.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/25/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            // Create the user and convert it JSON
            var user = UserModel(email: email, password: password)
            let encoder = JSONEncoder()
            let jsonData = try! encoder.encode(user)
            print(jsonData)
            print("\n\n")
            
            
            //1. Construct the url for the api request
            let urlStr = "http://127.0.0.1:8000/api/user/login/"
            guard let url = URL(string: urlStr) else {fatalError()}
            var urlRequest = URLRequest(url: url)
            
            // Construct the request
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
            
            //2. Create a URL Session
            let session = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
                if (error != nil) {
                    print("\n=== Error in LOGIN request 'user/login' ===")
                    print(error ?? "error")
                } else {
                    //3. ensure the response status is 200 OK and that there is data
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let validData = data else {
//                            completion(.failure(.responseProblem))
                        return
                    }
                    
                    //4. Get response data
                    do {
                        let returnData = try JSONDecoder().decode(UserModel.self, from: validData)
                        print("\nResponse data:")
                        print(validData)
                        print()
                        print(returnData)
                    } catch {
                        print("error from response in 'user/post'")
                    }
                }
            }
            
            //4. Start the task
            session.resume()
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //dismissed if something was typed
        if (textField.text != "") {
            return true
        }
        //will stay if user didn't type anything yet
        else {
            if(emailTextField.isEditing) {
                textField.placeholder = "Enter email!"
            } else if (passwordTextField.isEditing) {
                textField.placeholder = "Enter password!"
            }
            
            return false;
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(emailTextField.isEditing) {
            emailTextField.endEditing(true);
            return true;
        } else if (passwordTextField.isEditing) {
            passwordTextField.endEditing(true);
            return true;
        }
        
        return true;
    }
    
    
    
}
