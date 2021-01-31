//
//  OnboardingCustomViews.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/27/21.
//

import UIKit



private class GenderView: UIView {
    
    lazy var headerTitle: UILabel = {
      let headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
      headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .medium)
      headerTitle.text = "Age"
      headerTitle.textAlignment = .center
      return headerTitle
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGreen
        addSubview(headerTitle)
    }
    
}




class AgeView: UIView, UITextFieldDelegate {
    
    var birthdateTextField: UITextField = {
        var textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 75))
        textField.placeholder = "Enter Birthday"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        
        return textField
    }()
    
    let datePicker = UIDatePicker()
    
    func createDatePicker() {
        //toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolBar.setItems([doneButton], animated: true)
        birthdateTextField.inputAccessoryView = toolBar
        
        // assign date Picker to text field
        birthdateTextField.inputView = datePicker
        
    }
    
//
//    lazy var birthdatePicker: UIDatePicker = {
//       let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//
////        print("\n\nwidth: \((superview?.frame.height)!) \nheight: \((superview?.frame.height)!)")
//        datePicker.frame = CGRect(x: 30, y: 100, width: 350, height: 200)
//        datePicker.timeZone = NSTimeZone.local
//        datePicker.backgroundColor = UIColor.white
//
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
//
//
//        print(datePicker.date)
//
//        return datePicker
//    }()
//
//    @objc func datePickerValueChanged(_ sender: UIDatePicker){
//
//            // Create date formatter
//            let dateFormatter: DateFormatter = DateFormatter()
//
//            // Set date format
//            dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
//
//            // Apply date format
//            let selectedDate: String = dateFormatter.string(from: sender.date)
//
//            print("Selected value \(selectedDate)")
//        }

    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        birthdateTextField.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGreen
        addSubview(birthdateTextField)
//        createDatePicker()
//        addSubview(birthdateInput)
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (birthdateTextField.text != "") {
            return true
        }
        return false
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false;
    }
    
}
