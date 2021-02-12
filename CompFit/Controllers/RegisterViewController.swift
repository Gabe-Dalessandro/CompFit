//
//  RegisterViewController.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/22/21.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        phoneNumberTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        if let phoneNumber = phoneNumberTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            
            //placeholder fields until I add the fields into the app
            let id = 0
            let firstName = "Jon"
            let lastName = "Snow"
            let email = "jsnow@gmail.com"
            let password = "fitness123"
            let totalPoints = 0
            let gender = 1
            
            // Create the user
            let newUser = UserModel(id: nil, firstName: firstName, lastName: lastName, email: email, password: password, totalPoints: totalPoints, gender: gender)
            let encoder = JSONEncoder()
            let jsonData = try! encoder.encode(newUser)
            
            // Construct the url for the api request
            let urlStr = "http://127.0.0.1:8000/api/user/post/"
            guard let url = URL(string: urlStr) else {fatalError()}
            var urlRequest = URLRequest(url: url)
            
            // Construct the request
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
            
            // create a session
            let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
                if (error != nil) {
                    print("\n=== Error in POST request 'user/post' ===")
                    print(error ?? "error")
                } else {
                    //ensure the response status is 200 OK and that there is data
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let validData = data else {
//                            completion(.failure(.responseProblem))
                        return
                    }
                    
                    // runs if we get the data from the response
                    do {
                        let returnData = try JSONDecoder().decode(UserModel.self, from: validData)
                        print("Response data:")
                        print(returnData)
                    } catch {
                        print("error from response in 'user/post'")
                    }
                } //else
            } //let dataTask
            
            dataTask.resume()
        }
    }
    
    
    
    func parseJson(_ responseData: Data) -> String {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UserModel].self, from: responseData)
//            let firstName = decodedData.firstName
            print("printing decoded Json data")
            print(decodedData[0])
        } catch {
            print("Error in JSON decoding!")
            return "error"
        }
            
        return ""
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






extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //dismissed if something was typed
        if (textField.text != "") {
            return true
        }
        //will stay if user didn't type anything yet
        else {
            if (phoneNumberTextField.isEditing) {
                textField.placeholder = "Enter first name!"
            }
            else if(emailTextField.isEditing) {
                textField.placeholder = "Enter email!"
            } else if (passwordTextField.isEditing) {
                textField.placeholder = "Enter password!"
            }
            
            return false;
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (phoneNumberTextField.isEditing){
            phoneNumberTextField.endEditing(true)
            return true
        }
        else if(emailTextField.isEditing) {
            emailTextField.endEditing(true);
            return true;
        } else if (passwordTextField.isEditing) {
            passwordTextField.endEditing(true);
            return true;
        }
        
        return true;
    }

}
