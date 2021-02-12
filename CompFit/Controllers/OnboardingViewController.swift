//
//  OnboardingViewController.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/26/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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







//
//
//import UIKit
//
//class OnboardingViewController: UIViewController {
//
//    // The code is within a closure/annoyomous function
//    private let previousButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("PREV", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.setTitleColor(UIColor.gray, for: .normal)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//
//    // The code is within a closure/annoyomous function
//    private let nextButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("NEXT", for: .normal)
//
//        //set the font
//        let lightBlue = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
//        button.setTitleColor(lightBlue, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//
//    // buttons to determine what page number you're on
//    private let pageControls: UIPageControl = {
//        let pc = UIPageControl()
//        pc.currentPage = 0
//        pc.numberOfPages = 6
//
//        //dots on the bottom
//        pc.currentPageIndicatorTintColor = .systemBlue
//        pc.pageIndicatorTintColor = .gray
//
//        return pc
//    }()
//
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupBottomControls()
//    }
//
//
//    fileprivate func setupBottomControls() {
//
//        // Create a stack view to help arrange items within this area of the screen
//        let bottomControlsStackView = UIStackView(arrangedSubviews: [
//            previousButton,
//            pageControls,
//            nextButton
//        ])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillProportionally
//
//        // Add the stackview to the screen (the view)
//        view.addSubview(bottomControlsStackView)
//
//
//        //Placing the stackview on the bottom of the screen with constraints
//        NSLayoutConstraint.activate([
//            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//        ])
//
//
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
