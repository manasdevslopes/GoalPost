//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by MANAS VIJAYWARGIYA on 03/07/1940 Saka.
//  Copyright © 1940 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit
import CoreData

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .longTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.bindToKeyboard()
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        
        goalTextView.delegate = self
    }

    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalsVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentDetail(finishGoalVC)
//            presentingViewController?.presentSecondaryDetail(finishGoalVC)
            
            
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func textViewDidBeginEditing(_ textView: UITextView){
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
}
