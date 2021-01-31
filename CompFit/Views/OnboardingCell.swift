//
//  OnboardingPage.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/26/21.
//

import UIKit




class OnboardingCell: UICollectionViewCell {
    
    
    let onboardingTitleLabel: UILabel = {
        let textView = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Onboarding Cell: asks user about their workout habits", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25.0)])
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.numberOfLines = 0
//        textView.lineBreakMode = .byWordWrapping
//        textView.lineBreakStrategy = .standard
//        textView.baselineAdjustment = .none
        
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    
    var onboardingAnswerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var onboardingStackView2 = UIStackView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpOnboardingLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpOnboardingLayout() {
        let onboardingStackView = UIStackView(arrangedSubviews: [
            onboardingTitleLabel,
            onboardingAnswerView
            
        ])
        onboardingStackView.translatesAutoresizingMaskIntoConstraints = false
        onboardingStackView.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        onboardingStackView.axis = .vertical
        onboardingStackView.alignment = .fill
        onboardingStackView.spacing = 15
        onboardingStackView.backgroundColor = .red
        
        onboardingStackView2 = onboardingStackView
        
        
        addSubview(onboardingStackView)
        NSLayoutConstraint.activate([
            onboardingStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            onboardingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            onboardingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            onboardingStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            
        ])
    }
    
    
    
    
    public func updateOnboardingLayout(newView: UIView) {
//        print(onboardingStackView2.viewWithTag(1))
        onboardingStackView2.removeArrangedSubview(onboardingAnswerView)
        onboardingAnswerView.removeFromSuperview()
//        self.delete(onboardingAnswerView)
        onboardingAnswerView = newView
        onboardingStackView2.addArrangedSubview(onboardingAnswerView)

//
////
//        addSubview(onboardingStackView)
//        NSLayoutConstraint.activate([
//            onboardingStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 110),
//            onboardingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            onboardingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            onboardingStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85),
//
//        ])
    }
    
    
    
    
}
