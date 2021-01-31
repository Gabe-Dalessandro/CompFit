//
//  SwipingCollectionViewController.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/26/21.
//

import UIKit



class SwipingCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "OnboardingCell"
    
    let onboardingQuestions = ["How old are you?",
                               "What's your gender?",
                               "What is your experience level with fitness?",
                               "What types of workouts do you enjoy or would like to try?",
                               "What level of intensity do you want to workout at?",
                               "Sync with Apple Health"
    ]
    
    let onboardingCustomViews = [ AgeView(),
                                  AgeView(),
                                  AgeView(),
                                  AgeView(),
                                  AgeView(),
                                  AgeView(),]
    
    //PREV Button
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handlePrev(){
        let prevIndex = max(pageControls.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControls.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //NEXT Button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        let lightBlue = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(lightBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControls.currentPage + 1, onboardingQuestions.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControls.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //Page Controls: buttons to determine what page number you're on
    private lazy var pageControls: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = onboardingQuestions.count
        
        //dots on the bottom
        pc.currentPageIndicatorTintColor = .systemBlue
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
//
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
//        let x = targetContentOffset.pointee.x
//        print(x, view.frame.width, x/view.frame.width)
//        
//    }
//    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.backgroundColor = .white
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        
        //Delegate fields for the views
//        onboardingCustomViews[0].birthdateTextField.delegate = self
        
        setupBottomControls()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingQuestions.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardingCell
        
        let attributedText = NSMutableAttributedString(string: onboardingQuestions[indexPath.item], attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35.0)])
        cell.onboardingTitleLabel.attributedText = attributedText
        //        cell.onboardingAnswerView = GenderView()
        cell.updateOnboardingLayout(newView: onboardingCustomViews[indexPath.item])
        
        return cell
    }
    
    
    // Creates the size of the frames that we can swipe through
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        print("width: \(collectionView.safeAreaLayoutGuide.layoutFrame.width) \nheight: \(collectionView.safeAreaLayoutGuide.layoutFrame.height)")
        
        return CGSize(width: collectionView.safeAreaLayoutGuide.layoutFrame.width, height: collectionView.safeAreaLayoutGuide.layoutFrame.height)
    }
    
    
    
        fileprivate func setupBottomControls() {
            // Create a stack view to help arrange items within this area of the screen
            let bottomControlsStackView = UIStackView(arrangedSubviews: [
                previousButton,
                pageControls,
                nextButton
            ])
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.distribution = .fillProportionally
    
            // Add the stackview to the screen (the view)
            view.addSubview(bottomControlsStackView)
    
    
            //Placing the stackview on the bottom of the screen with constraints
            NSLayoutConstraint.activate([
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    
    
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    //    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    
    
    
    
    
}
